import 'package:flutter/material.dart';

class ProfileScreen6 extends StatefulWidget {
  const ProfileScreen6({Key? key}) : super(key: key);

  @override
  _ProfileScreen6State createState() => _ProfileScreen6State();
}

class _ProfileScreen6State extends State<ProfileScreen6> {
  bool _isDarkMode = false;
  int _currentIndex = 0;

  final List<Map<String, dynamic>> _cards = [
    {
      'title': 'Personal Details',
      'icon': Icons.person,
      'color': Colors.blue,
    },
    {
      'title': 'Activity History',
      'icon': Icons.history,
      'color': Colors.green,
    },
    {
      'title': 'App Settings',
      'icon': Icons.settings,
      'color': Colors.orange,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          actions: [
            IconButton(
              icon: Icon(_isDarkMode ? Icons.light_mode : Icons.dark_mode),
              onPressed: () {
                setState(() {
                  _isDarkMode = !_isDarkMode;
                });
              },
            ),
          ],
        ),
        body: Column(
          children: [
            _buildHeader(),
            const SizedBox(height: 20),
            Expanded(
              child: Stack(
                children: List.generate(_cards.length, (index) {
                  return _buildCard(index);
                }).reversed.toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16.0),
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
              color: _isDarkMode ? Colors.grey[400] : Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(int index) {
    final isActive = index == _currentIndex;
    final topPosition = isActive ? 0.0 : 50.0 + (index * 20.0);
    final card = _cards[index];

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      top: topPosition,
      left: 16,
      right: 16,
      child: GestureDetector(
        onTap: () => setState(() => _currentIndex = index),
        child: Card(
          elevation: isActive ? 8 : 4,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: isActive ? 400 : 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: _isDarkMode
                  ? Colors.grey[800]
                  : card['color'].withOpacity(0.1),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    card['icon'],
                    color: card['color'],
                  ),
                  title: Text(
                    card['title'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: isActive
                      ? Icon(
                          Icons.keyboard_arrow_up,
                          color: card['color'],
                        )
                      : Icon(
                          Icons.keyboard_arrow_down,
                          color: card['color'],
                        ),
                ),
                if (isActive) Expanded(child: _buildCardContent(index)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCardContent(int index) {
    switch (index) {
      case 0:
        return _buildPersonalDetails();
      case 1:
        return _buildActivityHistory();
      case 2:
        return _buildAppSettings();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildPersonalDetails() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildDetailItem('Email', 'john.doe@example.com', Icons.email),
          _buildDetailItem('Phone', '+1 234 567 8900', Icons.phone),
          _buildDetailItem('Location', 'New York, USA', Icons.location_on),
          _buildDetailItem('Birthday', 'January 1, 1990', Icons.cake),
        ],
      ),
    );
  }

  Widget _buildActivityHistory() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: 5,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.green[100],
            child: const Icon(Icons.check, color: Colors.green),
          ),
          title: Text('Activity ${index + 1}'),
          subtitle: Text('Completed on ${DateTime.now().subtract(
                Duration(days: index),
              ).toString().substring(0, 10)}'),
        );
      },
    );
  }

  Widget _buildAppSettings() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SwitchListTile(
            title: const Text('Push Notifications'),
            value: true,
            onChanged: (value) {},
          ),
          SwitchListTile(
            title: const Text('Email Updates'),
            value: false,
            onChanged: (value) {},
          ),
          ListTile(
            title: const Text('Language'),
            trailing: DropdownButton<String>(
              value: 'English',
              items: ['English', 'Spanish', 'French']
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
    );
  }

  Widget _buildDetailItem(String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: _cards[0]['color']),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: _isDarkMode ? Colors.grey[400] : Colors.grey[600],
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
