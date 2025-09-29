#!/bin/bash

set -e

# Configuration
LOCAL_CONFIG_PATH="./.cody/config"
UPGRADE_CONFIG_PATH="./.cody/config.upgrade"

# Function to output JSON result
output_json() {
    local status="$1"
    local from_version="$2"
    local to_version="$3"
    local message="$4"
    local backup_path="$5"

    cat <<EOF
{
  "status": "$status",
  "from_version": "$from_version",
  "to_version": "$to_version",
  "message": "$message",
  "backup_path": "$backup_path"
}
EOF
}

# Function to extract version from JSON
extract_version() {
    local json_content="$1"
    echo "$json_content" | grep '"version"' | sed 's/.*"version"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/' | tr -d '[:space:]'
}

# Check if we're running from the upgrade config directory
current_script_path="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [[ ! "$current_script_path" =~ config\.upgrade/scripts$ ]]; then
    output_json "error" "" "" "This script must be run from the config.upgrade/scripts directory." ""
    exit 1
fi

# Check if upgrade config directory exists
if [ ! -d "$UPGRADE_CONFIG_PATH" ]; then
    output_json "error" "" "" "Upgrade directory not found at $UPGRADE_CONFIG_PATH. Run upgrade-download.sh first." ""
    exit 1
fi

# Check if original config directory exists
if [ ! -d "$LOCAL_CONFIG_PATH" ]; then
    output_json "error" "" "" "Original config directory not found at $LOCAL_CONFIG_PATH." ""
    exit 1
fi

# Get current version from original config
CURRENT_VERSION=""
if [ -f "$LOCAL_CONFIG_PATH/settings.json" ]; then
    current_content=$(cat "$LOCAL_CONFIG_PATH/settings.json" 2>/dev/null) || {
        output_json "error" "" "" "Could not read current settings.json file." ""
        exit 1
    }
    CURRENT_VERSION=$(extract_version "$current_content")
fi

# Get target version from upgrade config
TARGET_VERSION=""
if [ -f "$UPGRADE_CONFIG_PATH/settings.json" ]; then
    upgrade_content=$(cat "$UPGRADE_CONFIG_PATH/settings.json" 2>/dev/null) || {
        output_json "error" "$CURRENT_VERSION" "" "Could not read upgrade settings.json file." ""
        exit 1
    }
    TARGET_VERSION=$(extract_version "$upgrade_content")
else
    output_json "error" "$CURRENT_VERSION" "" "Upgrade settings.json file not found." ""
    exit 1
fi

# Create backup of current config with timestamp
backup_path="${LOCAL_CONFIG_PATH}.backup.$(date +%Y%m%d_%H%M%S)"
cp -r "$LOCAL_CONFIG_PATH" "$backup_path" 2>/dev/null || {
    output_json "error" "$CURRENT_VERSION" "$TARGET_VERSION" "Failed to create backup of current configuration." ""
    exit 1
}

# Remove original config directory
rm -rf "$LOCAL_CONFIG_PATH" || {
    output_json "error" "$CURRENT_VERSION" "$TARGET_VERSION" "Failed to remove original config directory. Backup available at $backup_path." "$backup_path"
    exit 1
}

# Rename upgrade config to become the new config
mv "$UPGRADE_CONFIG_PATH" "$LOCAL_CONFIG_PATH" || {
    output_json "error" "$CURRENT_VERSION" "$TARGET_VERSION" "Failed to install new config directory. Backup available at $backup_path." "$backup_path"
    # Try to restore from backup if the rename failed
    if [ -d "$backup_path" ]; then
        cp -r "$backup_path" "$LOCAL_CONFIG_PATH" 2>/dev/null || true
    fi
    exit 1
}

# Verify the installation
if [ -f "$LOCAL_CONFIG_PATH/settings.json" ]; then
    installed_content=$(cat "$LOCAL_CONFIG_PATH/settings.json" 2>/dev/null)
    if [ -n "$installed_content" ]; then
        installed_version=$(extract_version "$installed_content")
        if [ "$installed_version" = "$TARGET_VERSION" ]; then
            output_json "success" "$CURRENT_VERSION" "$TARGET_VERSION" "Cody framework successfully upgraded. Backup of previous version created." "$backup_path"
        else
            output_json "error" "$CURRENT_VERSION" "$installed_version" "Installation completed but version verification failed. Expected $TARGET_VERSION, got $installed_version. Backup available at $backup_path." "$backup_path"
        fi
    else
        output_json "error" "$CURRENT_VERSION" "" "Installation completed but could not read new settings.json file. Backup available at $backup_path." "$backup_path"
    fi
else
    output_json "error" "$CURRENT_VERSION" "" "Installation completed but new settings.json file not found. Backup available at $backup_path." "$backup_path"
fi