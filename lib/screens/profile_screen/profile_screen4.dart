import 'package:flutter/material.dart';

class ProfileScreen4 extends StatefulWidget {
  const ProfileScreen4({Key? key}) : super(key: key);

  @override
  _ProfileScreen4State createState() => _ProfileScreen4State();
}

class _ProfileScreen4State extends State<ProfileScreen4> {
  int _selectedIndex = 0;
  final List<String> _sections = [
    'Personal Info',
    'Security',
    'Notifications',
    'Privacy',
    'Help & Support',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        elevation: 0,
      ),
      body: Row(
        children: [
          Container(
            width: 200,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              border: Border(
                right: BorderSide(
                  color: Colors.grey[300]!,
                ),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 20),
                const CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      NetworkImage('https://via.placeholder.com/150'),
                ),
                const SizedBox(height: 10),
                const Text(
                  'John Doe',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: _sections.length,
                    itemBuilder: (context, index) {
                      return _buildNavigationItem(index);
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _buildContent(_selectedIndex),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationItem(int index) {
    final bool isSelected = _selectedIndex == index;
    return ListTile(
      leading: Icon(
        _getIconForSection(index),
        color: isSelected ? Colors.blue : Colors.grey,
      ),
      title: Text(
        _sections[index],
        style: TextStyle(
          color: isSelected ? Colors.blue : Colors.black,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      selected: isSelected,
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }

  IconData _getIconForSection(int index) {
    switch (index) {
      case 0:
        return Icons.person;
      case 1:
        return Icons.security;
      case 2:
        return Icons.notifications;
      case 3:
        return Icons.privacy_tip;
      case 4:
        return Icons.help;
      default:
        return Icons.error;
    }
  }

  Widget _buildContent(int index) {
    switch (index) {
      case 0:
        return _buildPersonalInfo();
      case 1:
        return _buildSecurity();
      case 2:
        return _buildNotifications();
      case 3:
        return _buildPrivacy();
      case 4:
        return _buildHelpSupport();
      default:
        return const Center(child: Text('Select a section'));
    }
  }

  Widget _buildPersonalInfo() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Personal Information',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          _buildTextField('Full Name', 'John Doe'),
          _buildTextField('Email', 'john.doe@example.com'),
          _buildTextField('Phone', '+1 234 567 8900'),
          _buildTextField('Location', 'New York, USA'),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, String initialValue) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        controller: TextEditingController(text: initialValue),
      ),
    );
  }

  Widget _buildSecurity() {
    return const Center(child: Text('Security Settings'));
  }

  Widget _buildNotifications() {
    return const Center(child: Text('Notification Preferences'));
  }

  Widget _buildPrivacy() {
    return const Center(child: Text('Privacy Settings'));
  }

  Widget _buildHelpSupport() {
    return const Center(child: Text('Help & Support'));
  }
}
