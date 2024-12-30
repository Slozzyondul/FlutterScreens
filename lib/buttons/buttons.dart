import 'package:flutter/material.dart';
import 'simple_round_button.dart';
import 'simple_round_icon_button.dart';
import 'simple_round_only_icon_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'advanced_buttons.dart';

class ButtonExample extends StatelessWidget {
  // Function to launch GitHub URL
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
      appBar: AppBar(
        title: Text('Button Examples'),
        backgroundColor: Colors.grey[200],
        foregroundColor: Colors.grey[800],
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
      body: Container(
        padding: EdgeInsets.all(16),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Simple Round Button Section
              _buildSectionTitle('Simple Round Button'),
              _buildDescription(
                  'A basic rounded button with customizable background color and text.'),
              _buildCodePreview('''
SimpleRoundButton(
  backgroundColor: Colors.redAccent,
  buttonText: Text("LOGIN"),
)'''),
              SimpleRoundButton(
                backgroundColor: Colors.redAccent,
                buttonText: Text(
                  "LOGIN",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 32),

              // Simple Round Icon Button Section
              _buildSectionTitle('Simple Round Icon Button'),
              _buildDescription(
                  'A rounded button with an icon and text. The icon position can be customized.'),
              _buildCodePreview('''
SimpleRoundIconButton(
  backgroundColor: Colors.orangeAccent,
  buttonText: Text("SEND EMAIL"),
  icon: Icon(Icons.email),
)'''),
              SimpleRoundIconButton(
                backgroundColor: Colors.orangeAccent,
                buttonText: Text(
                  "SEND EMAIL",
                  style: TextStyle(color: Colors.white),
                ),
                icon: Icon(Icons.email),
              ),
              SizedBox(height: 16),
              SimpleRoundIconButton(
                backgroundColor: Colors.pinkAccent,
                buttonText: Text(
                  "LISTEN TO MUSIC",
                  style: TextStyle(color: Colors.white),
                ),
                icon: Icon(Icons.headset_mic),
                iconAlignment: Alignment.centerRight,
              ),
              SizedBox(height: 32),

              // Simple Round Only Icon Button Section
              _buildSectionTitle('Simple Round Only Icon Button'),
              _buildDescription(
                  'A circular button with only an icon. The icon color and position can be customized.'),
              _buildCodePreview('''
SimpleRoundOnlyIconButton(
  backgroundColor: Colors.lightGreen,
  icon: Icon(Icons.share),
  iconAlignment: Alignment.center,
)'''),
              SimpleRoundOnlyIconButton(
                backgroundColor: Colors.lightGreen,
                icon: Icon(Icons.share),
                iconAlignment: Alignment.center,
              ),
              SizedBox(height: 32),

              // Combined Examples Section
              _buildSectionTitle('Combined Examples'),
              _buildDescription(
                  'Examples showing different combinations and layouts of the buttons.'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.43,
                    child: SimpleRoundOnlyIconButton(
                      backgroundColor: Colors.blueAccent,
                      icon: Icon(Icons.phone),
                      iconAlignment: Alignment.center,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.43,
                    child: SimpleRoundOnlyIconButton(
                      backgroundColor: Colors.redAccent,
                      icon: Icon(Icons.message),
                      iconAlignment: Alignment.center,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.58,
                    child: SimpleRoundIconButton(
                      backgroundColor: Colors.deepOrangeAccent,
                      buttonText: Text(
                        "PLAY",
                        style: TextStyle(color: Colors.white),
                      ),
                      icon: Icon(Icons.play_arrow),
                      iconAlignment: Alignment.centerRight,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.28,
                    child: SimpleRoundButton(
                      backgroundColor: Colors.greenAccent,
                      buttonText: Text(
                        "OK",
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ),
                ],
              ),

              // Advanced Buttons Section
              _buildSectionTitle('Advanced Buttons'),
              _buildDescription(
                  'A collection of modern animated buttons with various effects.'),

              // Primary Button
              _buildAdvancedButtonSection(
                'Primary Button',
                AdvancedButtons.primaryButton(
                  text: 'Primary',
                  onPressed: () {},
                ),
                'A basic elevated button with a solid background color.',
                '''
AdvancedButtons.primaryButton(
  text: 'Primary',
  onPressed: () {},
)''',
              ),

              // Secondary Button
              _buildAdvancedButtonSection(
                'Secondary Button',
                AdvancedButtons.secondaryButton(
                  text: 'Secondary',
                  onPressed: () {},
                ),
                'An outlined button with a transparent background.',
                '''
AdvancedButtons.secondaryButton(
  text: 'Secondary',
  onPressed: () {},
)''',
              ),

              // Text Button
              _buildAdvancedButtonSection(
                'Text Button',
                AdvancedButtons.textButton(
                  text: 'Text Button',
                  onPressed: () {},
                ),
                'A simple text button without background or borders.',
                '''
AdvancedButtons.textButton(
  text: 'Text Button',
  onPressed: () {},
)''',
              ),

              // Icon Text Button
              _buildAdvancedButtonSection(
                'Icon Text Button',
                AdvancedButtons.iconTextButton(
                  text: 'Icon Button',
                  icon: Icons.star,
                  onPressed: () {},
                ),
                'A button that combines an icon with text.',
                '''
AdvancedButtons.iconTextButton(
  text: 'Icon Button',
  icon: Icons.star,
  onPressed: () {},
)''',
              ),

              // Disabled Button
              _buildAdvancedButtonSection(
                'Disabled Button',
                AdvancedButtons.disabledButton(
                  text: 'Disabled',
                ),
                'A button in a disabled state with muted colors.',
                '''
AdvancedButtons.disabledButton(
  text: 'Disabled',
)''',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.grey[800],
        ),
      ),
    );
  }

  Widget _buildDescription(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey[700],
        ),
      ),
    );
  }

  Widget _buildCodePreview(String code) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Text(
        code,
        style: TextStyle(
          fontFamily: 'monospace',
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildAdvancedButtonSection(
      String title, Widget button, String description, String code) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(title),
        _buildDescription(description),
        _buildCodePreview(code),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Center(child: button),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
