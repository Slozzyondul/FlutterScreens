import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home_screen1.dart';
import 'home_screen2.dart';
import 'home_screen3.dart';
import 'home_screen4.dart';
import 'home_screen5.dart';
import 'home_screen6.dart';

class HomeScreen extends StatelessWidget {
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
          'Home Screen',
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
            'Home Screen 1',
            'Adaptive UI with animated header and gyroscope effects',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => HomeScreen1()),
            ),
          ),
          _buildScreenCard(
            context,
            'Home Screen 2',
            'AI-powered interface with ambient color transitions',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => HomeScreen2()),
            ),
          ),
          _buildScreenCard(
            context,
            'Home Screen 3',
            'Zero-gravity carousel with spatial navigation',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => HomeScreen3()),
            ),
          ),
          _buildScreenCard(
            context,
            'Home Screen 4',
            'Holographic map interface with proximity detection',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => HomeScreen4()),
            ),
          ),
          _buildScreenCard(
            context,
            'Home Screen 5',
            'Neural network visualization with interactive cards',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => HomeScreen5()),
            ),
          ),
          _buildScreenCard(
            context,
            'Home Screen 6',
            'Quantum-inspired interface with crystalline widgets',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => HomeScreen6()),
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
