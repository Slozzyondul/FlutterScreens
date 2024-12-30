import 'package:flutter/material.dart';

class SettingsScreen2 extends StatefulWidget {
  const SettingsScreen2({Key? key}) : super(key: key);

  @override
  _SettingsScreen2State createState() => _SettingsScreen2State();
}

class _SettingsScreen2State extends State<SettingsScreen2> {
  int _selectedSegment = 0;
  double _fontSize = 14;
  double _notificationFrequency = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SegmentedButton<int>(
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
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: IndexedStack(
                index: _selectedSegment,
                children: [
                  // General Settings
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Font Size'),
                      Slider(
                        value: _fontSize,
                        min: 12,
                        max: 24,
                        divisions: 12,
                        label: _fontSize.round().toString(),
                        onChanged: (value) {
                          setState(() => _fontSize = value);
                        },
                      ),
                      const SizedBox(height: 20),
                      const Text('Notification Frequency (hours)'),
                      Slider(
                        value: _notificationFrequency,
                        min: 1,
                        max: 24,
                        divisions: 23,
                        label: _notificationFrequency.round().toString(),
                        onChanged: (value) {
                          setState(() => _notificationFrequency = value);
                        },
                      ),
                    ],
                  ),
                  // Privacy Settings
                  const Center(child: Text('Privacy Settings')),
                  // Account Settings
                  const Center(child: Text('Account Settings')),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Reset settings logic
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Settings reset to default')),
                );
              },
              child: const Text('Reset Settings'),
            ),
          ),
        ],
      ),
    );
  }
}
