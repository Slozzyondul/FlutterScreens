import 'package:flutter/material.dart';

class SettingsScreen3 extends StatefulWidget {
  const SettingsScreen3({Key? key}) : super(key: key);

  @override
  _SettingsScreen3State createState() => _SettingsScreen3State();
}

class _SettingsScreen3State extends State<SettingsScreen3> {
  final List<bool> _isExpanded = [false, false, false];

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
                    return const ListTile(
                      leading: Icon(Icons.palette),
                      title: Text('Appearance'),
                    );
                  },
                  body: Column(
                    children: [
                      ListTile(
                        title: const Text('Dark Mode'),
                        trailing: Switch(
                          value: false,
                          onChanged: (value) {},
                        ),
                      ),
                      ListTile(
                        title: const Text('Font Size'),
                        trailing: DropdownButton<String>(
                          value: 'Medium',
                          items: ['Small', 'Medium', 'Large']
                              .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ))
                              .toList(),
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  ),
                  isExpanded: _isExpanded[0],
                ),
                ExpansionPanel(
                  headerBuilder: (context, isExpanded) {
                    return const ListTile(
                      leading: Icon(Icons.notifications),
                      title: Text('Notifications'),
                    );
                  },
                  body: Column(
                    children: [
                      ListTile(
                        title: const Text('Push Notifications'),
                        trailing: Switch(
                          value: true,
                          onChanged: (value) {},
                        ),
                      ),
                      ListTile(
                        title: const Text('Email Notifications'),
                        trailing: Switch(
                          value: false,
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  ),
                  isExpanded: _isExpanded[1],
                ),
                ExpansionPanel(
                  headerBuilder: (context, isExpanded) {
                    return const ListTile(
                      leading: Icon(Icons.security),
                      title: Text('Security'),
                    );
                  },
                  body: Column(
                    children: [
                      ListTile(
                        title: const Text('Biometric Login'),
                        trailing: Switch(
                          value: true,
                          onChanged: (value) {},
                        ),
                      ),
                      ListTile(
                        title: const Text('Two-Factor Authentication'),
                        trailing: Switch(
                          value: false,
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  ),
                  isExpanded: _isExpanded[2],
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Reset settings logic
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Settings reset to default')),
          );
        },
        child: const Icon(Icons.restore),
      ),
    );
  }
}
