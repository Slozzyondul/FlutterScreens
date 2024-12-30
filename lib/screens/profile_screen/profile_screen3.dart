import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen3 extends StatelessWidget {
  const ProfileScreen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            const SizedBox(height: 20),
            _buildSection(
              title: 'Personal Information',
              children: [
                _buildInfoTile('Name', 'John Doe', Icons.person),
                _buildInfoTile('Email', 'john.doe@example.com', Icons.email),
                _buildInfoTile('Phone', '+1 234 567 8900', Icons.phone),
                _buildInfoTile('Location', 'New York, USA', Icons.location_on),
              ],
            ),
            _buildSection(
              title: 'App Preferences',
              children: [
                SwitchListTile(
                  title: const Text('Push Notifications'),
                  secondary: const Icon(Icons.notifications),
                  value: true,
                  onChanged: (bool value) {},
                ),
                SwitchListTile(
                  title: const Text('Email Notifications'),
                  secondary: const Icon(Icons.mail),
                  value: false,
                  onChanged: (bool value) {},
                ),
                ListTile(
                  leading: const Icon(Icons.language),
                  title: const Text('Language'),
                  trailing: DropdownButton<String>(
                    value: 'English',
                    onChanged: (String? value) {},
                    items: ['English', 'Spanish', 'French'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            _buildSection(
              title: 'Linked Accounts',
              children: [
                _buildLinkAccountTile(
                  'Google',
                  FontAwesomeIcons.google,
                  Colors.red,
                  true,
                ),
                _buildLinkAccountTile(
                  'Facebook',
                  Icons.facebook,
                  Colors.blue,
                  false,
                ),
                _buildLinkAccountTile(
                  'Twitter',
                  Icons.flutter_dash,
                  Colors.lightBlue,
                  false,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Confirm Logout'),
                        content:
                            const Text('Are you sure you want to log out?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              // Implement logout functionality
                              Navigator.pop(context);
                            },
                            child: const Text('Logout'),
                          ),
                        ],
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Logout'),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
      ),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
          ),
          const SizedBox(height: 16),
          const Text(
            'John Doe',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Flutter Developer',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required List<Widget> children,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(height: 1),
          ...children,
        ],
      ),
    );
  }

  Widget _buildInfoTile(String title, String value, IconData icon) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(value),
    );
  }

  Widget _buildLinkAccountTile(
    String platform,
    IconData icon,
    Color color,
    bool isLinked,
  ) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(platform),
      trailing: TextButton(
        onPressed: () {},
        child: Text(isLinked ? 'Unlink' : 'Link'),
      ),
    );
  }
}
