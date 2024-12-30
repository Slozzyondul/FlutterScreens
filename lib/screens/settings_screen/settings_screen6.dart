import 'package:flutter/material.dart';

class SettingsScreen6 extends StatefulWidget {
  const SettingsScreen6({Key? key}) : super(key: key);

  @override
  _SettingsScreen6State createState() => _SettingsScreen6State();
}

class _SettingsScreen6State extends State<SettingsScreen6> {
  bool _darkMode = false;
  final TextEditingController _searchController = TextEditingController();
  List<SettingItem> _filteredSettings = [];
  final List<SettingItem> _allSettings = [
    SettingItem(
      'Privacy',
      Icons.privacy_tip_outlined,
      'Control your privacy settings',
      'privacy',
    ),
    SettingItem(
      'Security',
      Icons.security_outlined,
      'Manage your security preferences',
      'security',
    ),
    SettingItem(
      'Notifications',
      Icons.notifications_outlined,
      'Configure notification settings',
      'notifications',
    ),
    // Add more settings items here
  ];

  @override
  void initState() {
    super.initState();
    _filteredSettings = _allSettings;
    _searchController.addListener(_filterSettings);
  }

  void _filterSettings() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredSettings = _allSettings.where((setting) {
        return setting.title.toLowerCase().contains(query) ||
            setting.description.toLowerCase().contains(query) ||
            setting.category.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        elevation: 0,
        actions: [
          Switch(
            value: _darkMode,
            onChanged: (value) {
              setState(() => _darkMode = value);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search settings...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: _filteredSettings.length,
              itemBuilder: (context, index) {
                final setting = _filteredSettings[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: ListTile(
                    leading: Icon(setting.icon, size: 28),
                    title: Text(
                      setting.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(setting.description),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      // Handle setting tap
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

class SettingItem {
  final String title;
  final IconData icon;
  final String description;
  final String category;

  SettingItem(this.title, this.icon, this.description, this.category);
}
