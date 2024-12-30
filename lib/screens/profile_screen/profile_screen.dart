import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'profile_screen1.dart';
import 'profile_screen2.dart';
import 'profile_screen3.dart';
import 'profile_screen4.dart';
import 'profile_screen5.dart';
import 'profile_screen6.dart';

class ProfileScreenShowcase extends StatelessWidget {
  void _launchURL() async {
    const url = 'https://github.com/The-Young-Programer/FlutterScreens';
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0,
        title: Text(
          'Profile Screen',
          style: TextStyle(color: Colors.grey[900]),
        ),
        iconTheme: IconThemeData(color: Colors.grey[900]),
        actions: [
          ElevatedButton.icon(
            onPressed: _launchURL,
            icon: Icon(Icons.code),
            label: Text('View Code'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildScreenCard(
            context,
            'Profile Screen 1',
            'Clean and modern profile design with user stats',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ProfileScreen1()),
            ),
          ),
          _buildScreenCard(
            context,
            'Profile Screen 2',
            'Social media style profile with activity feed',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ProfileScreen2()),
            ),
          ),
          _buildScreenCard(
            context,
            'Profile Screen 3',
            'Professional profile with achievements and skills',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ProfileScreen3()),
            ),
          ),
          _buildScreenCard(
            context,
            'Profile Screen 4',
            'Desktop-style profile with sidebar navigation',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ProfileScreen4()),
            ),
          ),
          _buildScreenCard(
            context,
            'Profile Screen 5',
            'Portfolio style profile with gallery and projects',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ProfileScreen5()),
            ),
          ),
          _buildScreenCard(
            context,
            'Profile Screen 6',
            'Minimalist profile with customizable themes',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ProfileScreen6()),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScreenCard(
    BuildContext context,
    String title,
    String description,
    VoidCallback onTap,
  ) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 8),
              Text(
                description,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: onTap,
                    child: Text('VIEW DEMO'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
