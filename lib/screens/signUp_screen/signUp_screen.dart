import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'signUp_screen1.dart';
import 'signUp_screen2.dart';
import 'signUp_screen3.dart';
import 'signUp_screen4.dart';
import 'signUp_screen5.dart';
import 'signUp_screen6.dart';

class SignUpScreenShowcase extends StatelessWidget {
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
          'Sign Up Screen',
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
            'Sign Up Screen 1',
            'Classic design with form validation and social login options',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => SignUpScreen1()),
            ),
          ),
          _buildScreenCard(
            context,
            'Sign Up Screen 2',
            'Split screen layout with illustration and form',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => SignUpScreen2()),
            ),
          ),
          _buildScreenCard(
            context,
            'Sign Up Screen 3',
            'Gradient background with floating card design',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => SignUpScreen3()),
            ),
          ),
          _buildScreenCard(
            context,
            'Sign Up Screen 4',
            'Multi-step registration with progress indicator',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => SignUpScreen4()),
            ),
          ),
          _buildScreenCard(
            context,
            'Sign Up Screen 5',
            'Phone verification with animated background',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => SignUpScreen5()),
            ),
          ),
          _buildScreenCard(
            context,
            'Sign Up Screen 6',
            'Glassmorphism design with gradient background',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => SignUpScreen6()),
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
