import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'splash_screen_1.dart';
import 'splash_screen_2.dart';
import 'splash_screen_3.dart';
import 'splash_screen_4.dart';
import 'splash_screen_5.dart';
import 'splash_screen_6.dart';

class SplashScreenShowcase extends StatelessWidget {
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
          'Splash Screen',
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
            'Splash Screen 1',
            'Classic design with gradient background and fade animation',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => SplashScreen1()),
            ),
          ),
          _buildScreenCard(
            context,
            'Splash Screen 2',
            'Dark theme with metallic gold accents and elegant animations',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => SplashScreen2()),
            ),
          ),
          _buildScreenCard(
            context,
            'Splash Screen 3',
            'Playful design with bouncing animations and floating shapes',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => SplashScreen3()),
            ),
          ),
          _buildScreenCard(
            context,
            'Splash Screen 4',
            'Futuristic tech theme with circuit patterns and pulse effects',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => SplashScreen4()),
            ),
          ),
          _buildScreenCard(
            context,
            'Splash Screen 5',
            'Nature-themed with animated birds and clouds',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => SplashScreen5()),
            ),
          ),
          _buildScreenCard(
            context,
            'Splash Screen 6',
            'Minimalist design with smooth transitions and clean typography',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => SplashScreen6()),
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
