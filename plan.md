# Upgrade Process Enhancement Plan

## Overview
Enhance the Cody Framework upgrade process to sync additional folders (`.claude`, `.github`, `.vscode`) beyond just `.cody/config`, with intelligent file merging to preserve user customizations.

## Current Behavior
- Only `.cody/config` folder is downloaded and replaced during upgrade
- All other project files remain untouched

## New Behavior
Download and selectively sync files from:
1. `.cody` - Full replacement (existing behavior)
2. `.claude` - Selective file sync
3. `.github` - Selective file sync

## Configuration Arrays

Files and settings managed by Cody Framework:

```bash
# Cody-managed files in .claude folder
CLAUDE_FILES=(
    "commands/cody.md"
)

# Cody-managed files in .github folder
GITHUB_FILES=(
    "prompts/cody.prompt.md"
)
```

## Sync Rules

### For `.claude` and `.github`:
- **If folder doesn't exist:** Create it and copy all Cody-managed files
- **If folder exists:** Only copy/overwrite Cody-managed files (from arrays above)
- **Result:** User's other files in these folders remain untouched

### For `.cody`:
- **Keep existing behavior:** Full replacement of `.cody/config` folder

## Implementation Changes

### File: `upgrade-download.sh`

**Current:** Extracts only `.cody/config` to `.cody/config.upgrade`

**New:** Extract multiple folders:
```bash
# Copy the config directory to config.upgrade
cp -r "$temp_dir/cody-framework-main/.cody/config" "$UPGRADE_CONFIG_PATH"

# Copy additional folders to config.upgrade
cp -r "$temp_dir/cody-framework-main/.claude" "$UPGRADE_CONFIG_PATH/.claude"
cp -r "$temp_dir/cody-framework-main/.github" "$UPGRADE_CONFIG_PATH/.github"
```

**Structure after download:**
```
.cody/config.upgrade/
├── (config files - existing)
├── .claude/
└── .github/
```

### File: `upgrade-install.sh`

#### 1. Add Configuration Arrays (top of file, after existing config)

```bash
# Cody-managed files to sync
CLAUDE_FILES=(
    "commands/cody.md"
)

GITHUB_FILES=(
    "prompts/cody.prompt.md"
)
```

#### 2. Add Helper Function: Selective File Sync

```bash
# Function to sync specific files from upgrade folder to target folder
# Args: $1=folder_name (e.g., ".claude"), $2=array_name (e.g., "CLAUDE_FILES[@]")
sync_folder_files() {
    local folder_name="$1"
    local -n files_array="$2"
    local source_folder="$UPGRADE_CONFIG_PATH/$folder_name"
    local target_folder="./$folder_name"

    # Skip if source doesn't exist
    if [ ! -d "$source_folder" ]; then
        return 0
    fi

    # Create target folder if it doesn't exist
    if [ ! -d "$target_folder" ]; then
        mkdir -p "$target_folder" 2>/dev/null || {
            echo "Warning: Could not create $target_folder" >&2
            return 1
        }
    fi

    # Copy each file in the array
    for file in "${files_array[@]}"; do
        local source_file="$source_folder/$file"
        local target_file="$target_folder/$file"

        if [ -f "$source_file" ]; then
            # Create parent directory if needed
            local parent_dir=$(dirname "$target_file")
            mkdir -p "$parent_dir" 2>/dev/null

            # Copy file (overwrites if exists)
            cp "$source_file" "$target_file" 2>/dev/null || {
                echo "Warning: Could not copy $file to $target_folder" >&2
            }
        fi
    done
}
```

#### 3. Update Main Installation Flow

After the existing `.cody/config` installation logic (around line 98), add:

```bash
# Sync additional folders
sync_folder_files ".claude" CLAUDE_FILES
sync_folder_files ".github" GITHUB_FILES
```

## Testing Scenarios

### Test Case 1: Fresh Install (folders don't exist)
- Run upgrade on project without `.claude`, `.github`
- **Expected:** All folders created with Cody files

### Test Case 2: Folders Exist, Files Don't
- Create empty `.claude`, `.github` folders
- Run upgrade
- **Expected:** Cody files added, folders remain

### Test Case 3: Files Exist (Overwrite)
- Create old version of `commands/cody.md`
- Run upgrade
- **Expected:** File overwritten with new version

### Test Case 4: User Files Preserved
- Add custom files to `.claude` and `.github`
- Run upgrade
- **Expected:** Custom files remain untouched, only Cody files updated

## Future Considerations

- Configuration arrays can be easily extended:
  ```bash
  CLAUDE_FILES=(
      "commands/cody.md"
      "commands/cody-advanced.md"  # Just add new entries
  )
  ```
- Consider moving arrays to external config file for easier maintenance
- Consider using `jq` for more robust JSON manipulation if available
- Add validation to ensure required files exist in downloaded version

## Backup Strategy

### New Versioned Backup Structure

Instead of timestamped backups, create version-based backups for better organization:

```
.cody/
├── backup/
│   ├── 1.1.2/              (previous version)
│   │   ├── .cody/
│   │   │   └── config/     (entire config folder)
│   │   ├── .claude/        (entire folder)
│   │   └── .github/        (entire folder)
│   ├── 1.1.1/              (older version)
│   │   └── ...
│   └── 1.1.0/              (even older)
│       └── ...
├── config/                 (current)
└── project/                (user data - never touched)
```

### Benefits:
- Clear version history for rollback
- Users can compare changes between versions
- Easy to clean up old backups by version
- More organized than timestamps
- Folder structure shows exactly what was backed up

### Implementation Changes:

**In upgrade-install.sh**, replace the current backup logic:

```bash
# OLD (around line 77):
backup_path="${LOCAL_CONFIG_PATH}.backup.$(date +%Y%m%d_%H%M%S)"

# NEW:
BACKUP_ROOT="./.cody/backup"
backup_path="${BACKUP_ROOT}/${CURRENT_VERSION}"

# Create backup directory structure
mkdir -p "$backup_path" 2>/dev/null || {
    output_json "error" "$CURRENT_VERSION" "$TARGET_VERSION" "Failed to create backup directory." ""
    exit 1
}

# Backup .cody/config (maintain folder structure)
if [ -d "$LOCAL_CONFIG_PATH" ]; then
    mkdir -p "$backup_path/.cody" 2>/dev/null
    cp -r "$LOCAL_CONFIG_PATH" "$backup_path/.cody/config" 2>/dev/null || {
        output_json "error" "$CURRENT_VERSION" "$TARGET_VERSION" "Failed to backup config directory." ""
        exit 1
    }
fi

# Backup .claude folder (if exists)
if [ -d "./.claude" ]; then
    cp -r "./.claude" "$backup_path/.claude" 2>/dev/null
fi

# Backup .github folder (if exists)
if [ -d "./.github" ]; then
    cp -r "./.github" "$backup_path/.github" 2>/dev/null
fi
```

### Backup Path in Output:

Update success message to show cleaner path:
```bash
output_json "success" "$CURRENT_VERSION" "$TARGET_VERSION" "Cody framework successfully upgraded. Backup saved to .cody/backup/$CURRENT_VERSION" "$backup_path"
```

### Rollback Considerations:

Users can manually rollback by:
1. Viewing available backups: `ls .cody/backup/`
2. Restoring a version:
   ```bash
   cp -r .cody/backup/1.1.2/.cody/config .cody/config
   cp -r .cody/backup/1.1.2/.claude .claude
   cp -r .cody/backup/1.1.2/.github .github
   ```

### Future Enhancement:

Consider adding a `:cody rollback <version>` command to automate restoration from backups.
