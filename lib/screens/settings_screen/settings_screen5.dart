import 'package:flutter/material.dart';

class SettingsScreen5 extends StatefulWidget {
  const SettingsScreen5({Key? key}) : super(key: key);

  @override
  _SettingsScreen5State createState() => _SettingsScreen5State();
}

class _SettingsScreen5State extends State<SettingsScreen5> {
  bool _notifications = true;
  double _volume = 0.5;
  String _theme = 'System';
  bool _locationServices = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildCard(
              'Notifications',
              Icons.notifications_outlined,
              Switch(
                value: _notifications,
                onChanged: (value) {
                  setState(() => _notifications = value);
                },
              ),
            ),
            _buildCard(
              'Volume',
              Icons.volume_up_outlined,
              Slider(
                value: _volume,
                onChanged: (value) {
                  setState(() => _volume = value);
                },
              ),
            ),
            _buildCard(
              'Theme',
              Icons.palette_outlined,
              DropdownButton<String>(
                value: _theme,
                items: ['Light', 'Dark', 'System']
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() => _theme = value!);
                },
              ),
            ),
            _buildCard(
              'Location Services',
              Icons.location_on_outlined,
              Switch(
                value: _locationServices,
                onChanged: (value) {
                  setState(() => _locationServices = value);
                },
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Save changes logic
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Changes saved successfully!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                ),
                child: const Text('Save Changes'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String title, IconData icon, Widget trailing) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon),
                const SizedBox(width: 16),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: trailing,
            ),
          ],
        ),
      ),
    );
  }
}
