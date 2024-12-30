import 'package:flutter/material.dart';

class SettingsScreen1 extends StatefulWidget {
  const SettingsScreen1({Key? key}) : super(key: key);

  @override
  _SettingsScreen1State createState() => _SettingsScreen1State();
}

class _SettingsScreen1State extends State<SettingsScreen1> {
  bool notifications = true;
  bool darkMode = false;
  bool locationServices = true;

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
            Card(
              child: Column(
                children: [
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
                  ListTile(
                    leading: const Icon(Icons.dark_mode),
                    title: const Text('Dark Mode'),
                    trailing: Switch(
                      value: darkMode,
                      onChanged: (value) {
                        setState(() => darkMode = value);
                      },
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.location_on),
                    title: const Text('Location Services'),
                    trailing: Switch(
                      value: locationServices,
                      onChanged: (value) {
                        setState(() => locationServices = value);
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save settings logic
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Settings saved!')),
                );
              },
              child: const Text('Save Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
