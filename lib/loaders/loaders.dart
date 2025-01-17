import 'package:flutter/material.dart';
import 'color_loader.dart';
import 'color_loader_2.dart';
import 'color_loader_3.dart';
import 'color_loader_4.dart';
import 'color_loader_5.dart';
import 'flip_loader.dart';
import 'dot_type.dart';
import 'adv_loader.dart';
import 'package:url_launcher/url_launcher.dart';

class LoadersExample extends StatelessWidget {
  void _launchURL() async {
    const url = 'https://github.com/The-Young-Programer/FlutterScreens';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _buildSection(
      String title, String description, Widget loader, String codeSnippet) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue[900])),
        SizedBox(height: 8),
        Text(description,
            style: TextStyle(fontSize: 16, color: Colors.grey[700])),
        Container(
          height: 120,
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: loader,
        ),
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: Text(
            codeSnippet,
            style: TextStyle(fontFamily: 'monospace', fontSize: 14),
          ),
        ),
        Divider(height: 32),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0,
        title: Text(
          'Loaders',
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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              'Color Loader 1',
              'Simple circular progress indicator with color transitions',
              ColorLoader(
                colors: [Colors.red, Colors.green, Colors.blue, Colors.yellow],
                duration: Duration(seconds: 1),
              ),
              '''ColorLoader(
  colors: [Colors.red, Colors.green, Colors.blue, Colors.yellow],
  duration: Duration(seconds: 1),
)''',
            ),
            _buildSection(
              'Flip Loader',
              'Flipping square/circle with icon',
              Center(
                child: FlipLoader(
                  loaderBackground: Colors.redAccent,
                  iconColor: Colors.white,
                  icon: Icons.sync,
                  animationType: "full_flip",
                  shape: "square",
                  rotateIcon: true,
                ),
              ),
              '''FlipLoader(
  loaderBackground: Colors.redAccent,
  iconColor: Colors.white,
  icon: Icons.sync,
  animationType: "full_flip", // or "half_flip"
  shape: "square", // or "circle"
  rotateIcon: true,
)''',
            ),
            _buildSection(
              'Color Loader 2',
              'Three rotating arcs with customizable colors',
              ColorLoader2(),
              '''ColorLoader2(
  color1: Colors.deepOrangeAccent,
  color2: Colors.yellow,
  color3: Colors.lightGreen,
)''',
            ),
            _buildSection(
              'Color Loader 3',
              'Rotating dots in a circular pattern',
              ColorLoader3(),
              '''ColorLoader3(
  radius: 30.0,
  dotRadius: 3.0,
)''',
            ),
            _buildSection(
              'Color Loader 4',
              'Bouncing dots with customizable shapes',
              ColorLoader4(
                dotType: DotType.circle,
                dotOneColor: Colors.redAccent,
                dotTwoColor: Colors.green,
                dotThreeColor: Colors.blueAccent,
              ),
              '''ColorLoader4(
  dotType: DotType.circle,
  dotOneColor: Colors.redAccent,
  dotTwoColor: Colors.green,
  dotThreeColor: Colors.blueAccent,
)''',
            ),
            _buildSection(
              'Color Loader 5',
              'Fading dots with customizable shapes and colors',
              ColorLoader5(
                dotType: DotType.circle,
                dotOneColor: Colors.redAccent,
                dotTwoColor: Colors.green,
                dotThreeColor: Colors.blueAccent,
              ),
              '''ColorLoader5(
  dotType: DotType.circle,
  dotOneColor: Colors.redAccent,
  dotTwoColor: Colors.green,
  dotThreeColor: Colors.blueAccent,
)''',
            ),
            _buildSection(
              'Diamond Loader',
              'Loader with diamond shape',
              ColorLoader4(
                dotType: DotType.diamond,
                dotOneColor: Colors.pinkAccent,
                dotTwoColor: Colors.purple,
                dotThreeColor: Colors.deepPurple,
              ),
              '''ColorLoader4(
  dotType: DotType.diamond,
  dotOneColor: Colors.pinkAccent,
  dotTwoColor: Colors.purple,
  dotThreeColor: Colors.deepPurple,
)''',
            ),
            _buildSection(
              'Icon Loader',
              'Loader using custom icons',
              ColorLoader5(
                dotType: DotType.icon,
                dotIcon: Icon(Icons.favorite),
                dotOneColor: Colors.red,
                dotTwoColor: Colors.pink,
                dotThreeColor: Colors.pinkAccent,
              ),
              '''ColorLoader5(
  dotType: DotType.icon,
  dotIcon: Icon(Icons.favorite),
  dotOneColor: Colors.red,
  dotTwoColor: Colors.pink,
  dotThreeColor: Colors.pinkAccent,
)''',
            ),
            _buildSection(
              'Gradient Loader',
              'Circular progress indicator with gradient effect',
              AdvancedLoader(
                type: LoaderType.gradient,
                color: Colors.blue,
              ),
              '''AdvancedLoader(
  type: LoaderType.gradient,
  color: Colors.blue,
  size: 50.0,
)''',
            ),
            _buildSection(
              'Shimmer Loader',
              'Shimmering effect loader with customizable colors',
              AdvancedLoader(
                type: LoaderType.shimmer,
                color: Colors.blue,
              ),
              '''AdvancedLoader(
  type: LoaderType.shimmer,
  color: Colors.blue,
  size: 50.0,
)''',
            ),
            _buildSection(
              'Chasing Dots',
              'Animated dots chasing each other in a circle',
              AdvancedLoader(
                type: LoaderType.dots,
                color: Colors.blue,
              ),
              '''AdvancedLoader(
  type: LoaderType.dots,
  color: Colors.blue,
  size: 50.0,
)''',
            ),
            _buildSection(
              'Wave Loader',
              'Animated wave effect with customizable properties',
              AdvancedLoader(
                type: LoaderType.wave,
                color: Colors.blue,
              ),
              '''AdvancedLoader(
  type: LoaderType.wave,
  color: Colors.blue,
  size: 50.0,
)''',
            ),
            _buildSection(
              '3D Progress Bar',
              'Custom 3D progress bar with animation',
              ProgressBar3D(
                color: Colors.blue,
                size: 40.0,
              ),
              '''ProgressBar3D(
  color: Colors.blue,
  size: 40.0,
)''',
            ),
            if (context
                    .findAncestorWidgetOfExactType<MaterialApp>()
                    ?.theme
                    ?.platform ==
                TargetPlatform.android)
              _buildSection(
                'Lottie Loader',
                'Lottie animation based loader',
                AdvancedLoader(
                  type: LoaderType.lottie,
                  size: 100.0,
                ),
                '''AdvancedLoader(
  type: LoaderType.lottie,
  size: 100.0,
)
// Note: Requires loading.json in assets/animations/''',
              ),
          ],
        ),
      ),
    );
  }
}
