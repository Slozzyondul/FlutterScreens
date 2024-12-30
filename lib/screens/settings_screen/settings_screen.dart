import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'settings_screen1.dart';
import 'settings_screen2.dart';
import 'settings_screen3.dart';
import 'settings_screen4.dart';
import 'settings_screen5.dart';
import 'settings_screen6.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  void _launchURL() async {
    const url = 'https://github.com/The-Young-Programer/FlutterScreens';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings Screen Examples'),
        backgroundColor: Colors.grey[200],
        foregroundColor: Colors.grey[800],
        actions: [
          ElevatedButton.icon(
            onPressed: _launchURL,
            icon: const Icon(Icons.code),
            label: const Text('View Code'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Basic Settings Screen
            _buildSection(
              'Basic Settings Screen',
              'A simple settings screen with toggles and a save button',
              const SettingsScreen1(),
              '''
class SettingsScreen1 extends StatefulWidget {
  // Basic settings implementation with toggles
  // Features: Notifications, Dark Mode, Location Services
  ListTile(
    leading: const Icon(Icons.notifications),
    title: const Text('Notifications'),
    trailing: Switch(
      value: notifications,
      onChanged: (value) {
        setState(() => notifications = value);
      },
    ),
  ),
''',
            ),

            // Segmented Settings Screen
            _buildSection(
              'Segmented Settings Screen',
              'Settings with segmented control and sliders',
              const SettingsScreen2(),
              '''
class SettingsScreen2 extends StatefulWidget {
  // Segmented control implementation
  SegmentedButton<int>(
    segments: const [
      ButtonSegment(value: 0, label: Text('General')),
      ButtonSegment(value: 1, label: Text('Privacy')),
      ButtonSegment(value: 2, label: Text('Account')),
    ],
    selected: {_selectedSegment},
    onSelectionChanged: (Set<int> newSelection) {
      setState(() {
        _selectedSegment = newSelection.first;
      });
    },
  ),
''',
            ),

            // Collapsible Settings Screen
            _buildSection(
              'Collapsible Settings Screen',
              'Settings with expandable sections',
              const SettingsScreen3(),
              '''
class SettingsScreen3 extends StatefulWidget {
  // Expandable panels implementation
  ExpansionPanelList(
    elevation: 1,
    expandedHeaderPadding: EdgeInsets.zero,
    expansionCallback: (int index, bool isExpanded) {
      setState(() {
        _isExpanded[index] = !isExpanded;
      });
    },
    children: [
      ExpansionPanel(
        headerBuilder: (context, isExpanded) {
          return ListTile(
            leading: Icon(Icons.palette),
            title: Text('Appearance'),
          );
        },
        body: settingsContent,
        isExpanded: _isExpanded[0],
      ),
    ],
  ),
''',
            ),

            // Minimalist Settings Screen
            _buildSection(
              'Minimalist Settings Screen',
              'Clean layout with hidden advanced options',
              const SettingsScreen4(),
              '''
class SettingsScreen4 extends StatefulWidget {
  // Minimalist implementation with hidden options
  Widget _buildSettingItem(IconData icon, String title) {
    return Row(
      children: [
        Icon(icon, size: 32),
        const SizedBox(width: 16),
        Text(title, style: TextStyle(fontSize: 18)),
        const Spacer(),
        const Icon(Icons.chevron_right),
      ],
    );
  }
''',
            ),

            // Modern Card Settings Screen
            _buildSection(
              'Modern Card Settings Screen',
              'Card-based layout with interactive elements',
              const SettingsScreen5(),
              '''
class SettingsScreen5 extends StatefulWidget {
  // Card-based implementation
  Widget _buildCard(String title, IconData icon, Widget trailing) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [Icon(icon), Text(title)]),
            SizedBox(width: double.infinity, child: trailing),
          ],
        ),
      ),
    );
  }
''',
            ),

            // Searchable Settings Screen
            _buildSection(
              'Searchable Settings Screen',
              'Settings with search functionality and dark mode toggle',
              const SettingsScreen6(),
              '''
class SettingsScreen6 extends StatefulWidget {
  // Searchable implementation
  TextField(
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
''',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
      String title, String description, Widget component, String sourceCode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(title),
        _buildDescription(description),
        _buildCodePreview(sourceCode),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 16),
          height: 400, // Fixed height for consistent display
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8),
          ),
          child: component,
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.grey[800],
        ),
      ),
    );
  }

  Widget _buildDescription(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey[700],
        ),
      ),
    );
  }

  Widget _buildCodePreview(String code) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Text(
        code,
        style: const TextStyle(
          fontFamily: 'monospace',
          fontSize: 14,
        ),
      ),
    );
  }
}
