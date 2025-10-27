import unittest
import os

class TestUpgradeCommand(unittest.TestCase):
    def test_upgrade_install_path(self):
        with open('.cody/config/commands/upgrade.md', 'r') as f:
            content = f.read()
        self.assertIn('{{cfScripts}}/upgrade-install.sh', content)
        self.assertNotIn('./.cody/config.upgrade/scripts/upgrade-install.sh', content)

if __name__ == '__main__':
    unittest.main()
