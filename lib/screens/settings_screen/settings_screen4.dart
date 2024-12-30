import 'package:flutter/material.dart';

class SettingsScreen4 extends StatefulWidget {
  const SettingsScreen4({Key? key}) : super(key: key);

  @override
  _SettingsScreen4State createState() => _SettingsScreen4State();
}

class _SettingsScreen4State extends State<SettingsScreen4> {
  bool _showAdvancedSettings = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSettingItem(Icons.person_outline, 'Profile'),
            _buildSettingItem(Icons.notifications_none, 'Notifications'),
            _buildSettingItem(Icons.privacy_tip_outlined, 'Privacy'),
            _buildSettingItem(Icons.language_outlined, 'Language'),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                setState(() {
                  _showAdvancedSettings = !_showAdvancedSettings;
                });
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(_showAdvancedSettings ? 'Less Options' : 'More Options'),
                  Icon(_showAdvancedSettings
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down),
                ],
              ),
            ),
            if (_showAdvancedSettings) ...[
              _buildSettingItem(Icons.storage_outlined, 'Data Usage'),
              _buildSettingItem(Icons.backup_outlined, 'Backup'),
              _buildSettingItem(Icons.security_outlined, 'Security'),
            ],
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Logout logic
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                  backgroundColor: Colors.red,
                ),
                child: const Text('Logout'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          Icon(icon, size: 32),
          const SizedBox(width: 16),
          Text(
            title,
            style: const TextStyle(fontSize: 18),
          ),
          const Spacer(),
          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}
