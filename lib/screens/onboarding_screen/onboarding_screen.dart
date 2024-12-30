import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'onboarding_screen1.dart';
import 'onboarding_screen2.dart';
import 'onboarding_screen3.dart';
import 'onboarding_screen4.dart';
import 'onboarding_screen5.dart';
import 'onboarding_screen6.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  void _launchURL() async {
    const url = 'https://github.com/The-Young-Programer/FlutterScreens';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
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
          'Onboarding Screen',
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
            'Onboarding Screen 1',
            'Animated illustrations with swipeable pages and progress indicator',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => OnboardingScreen1()),
            ),
          ),
          _buildScreenCard(
            context,
            'Onboarding Screen 2',
            'Vertical scrollable page with header animation and feature sections',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => OnboardingScreen2()),
            ),
          ),
          _buildScreenCard(
            context,
            'Onboarding Screen 3',
            'Carousel layout with auto-slide and gradient backgrounds',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => OnboardingScreen3()),
            ),
          ),
          _buildScreenCard(
            context,
            'Onboarding Screen 4',
            'Full-screen video background with dynamic text overlay',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => OnboardingScreen4()),
            ),
          ),
          _buildScreenCard(
            context,
            'Onboarding Screen 5',
            'Interactive elements with expanding images and motivational quotes',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => OnboardingScreen5()),
            ),
          ),
          _buildScreenCard(
            context,
            'Onboarding Screen 6',
            'Storytelling concept with animated illustrations and glowing CTA',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => OnboardingScreen6()),
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
