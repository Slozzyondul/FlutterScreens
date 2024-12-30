import 'package:flutter/material.dart';
import 'main2.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Screens',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      home: WelcomeScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/main2': (context) =>
            const MobileTemplate(), // Changed from Main2Screen to MobileTemplate
      },
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  int stars = 0;
  int forks = 0;
  int issues = 0;
  late AnimationController _controller;
  int _currentPage = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    fetchGitHubStats();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _toggleContent() {
    setState(() {
      if (_currentPage < 2) {
        _currentPage++;
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOutCubic,
        );
      } else {
        _currentPage = 0;
        _pageController.animateToPage(
          0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOutCubic,
        );
      }

      if (_controller.status == AnimationStatus.completed) {
        _controller.reverse();
      } else {
        _controller.forward();
      }
    });
  }

  Future<void> fetchGitHubStats() async {
    try {
      final repo = 'The-Young-Programer/FlutterScreens';
      final response = await http.get(
        Uri.parse('https://api.github.com/repos/$repo'),
        headers: {'Accept': 'application/vnd.github.v3+json'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          stars = data['stargazers_count'] ?? 0;
          forks = data['forks_count'] ?? 0;
          issues = data['open_issues_count'] ?? 0;
        });
      }
    } catch (e) {
      // Silently handle the error and keep default values
      print('Failed to fetch GitHub stats: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
                if (_currentPage > 0) {
                  _controller.forward();
                } else {
                  _controller.reverse();
                }
              });
            },
            children: [
              _buildMainContent(),
              _buildSecondPage(),
              _buildThirdPage(),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 20,
            child: Center(
              child: GestureDetector(
                onTap: _toggleContent,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue.shade300),
                    color: Colors.white,
                  ),
                  child: RotationTransition(
                    turns: Tween(begin: 0.0, end: 0.5).animate(_controller),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.blue.shade700,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              // Flutter Logo
              FlutterLogo(
                size: 120,
                style: FlutterLogoStyle.markOnly,
              ),
              const SizedBox(height: 30),
              Text(
                'Flutter Screens',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'A collection of beautifully designed Flutter UI screens',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/main2');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[700],
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        launchUrl(Uri.parse(
                            'https://github.com/The-Young-Programer/FlutterScreens'));
                      },
                      icon: const Icon(Icons.code, size: 16),
                      label: const Text('Contribute'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[200],
                        foregroundColor: Colors.black87,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // GitHub Stats Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildGithubStat(
                    icon: Icons.star_border,
                    label: 'Star',
                    count: stars,
                    onTap: () => launchUrl(Uri.parse(
                        'https://github.com/The-Young-Programer/FlutterScreens/stargazers')),
                  ),
                  const SizedBox(width: 16),
                  _buildGithubStat(
                    icon: Icons.call_split,
                    label: 'Fork',
                    count: forks,
                    onTap: () => launchUrl(Uri.parse(
                        'https://github.com/The-Young-Programer/FlutterScreens/fork')),
                  ),
                  const SizedBox(width: 16),
                  _buildGithubStat(
                    icon: Icons.bug_report_outlined,
                    label: 'Issues',
                    count: issues,
                    onTap: () => launchUrl(Uri.parse(
                        'https://github.com/The-Young-Programer/FlutterScreens/issues')),
                  ),
                ],
              ),
              const SizedBox(height: 72),
              // Footer
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Created with '),
                  Icon(Icons.favorite, color: Colors.red, size: 16),
                  const Text(' by '),
                  InkWell(
                    onTap: () => launchUrl(
                        Uri.parse('https://github.com/The-Young-Programer')),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Nemonet TYP '),
                        const Icon(Icons.code, color: Colors.grey, size: 16),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSecondPage() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  children: [
                    // Main Content Container (move to back)
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.blue[50]!.withOpacity(0.6),
                            Colors.white.withOpacity(0.7),
                            Colors.blue[50]!.withOpacity(0.6),
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'First Repository Reaction',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[900],
                                shadows: [
                                  Shadow(
                                    color: Colors.blue.withOpacity(0.3),
                                    offset: const Offset(2, 2),
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '🏆 Hall of Fame',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            const Divider(height: 30),
                            _buildReactionItem(
                              icon: Icons.star_border,
                              label: '1st Star',
                              future: _fetchFirstStar(),
                            ),
                            const SizedBox(height: 20),
                            _buildReactionItem(
                              icon: Icons.comment_outlined,
                              label: '1st Comment',
                              future: _fetchFirstComment(),
                            ),
                            const SizedBox(height: 20),
                            _buildReactionItem(
                              icon: Icons.call_split,
                              label: '1st Fork',
                              future: _fetchFirstFork(),
                            ),
                            const SizedBox(height: 20),
                            _buildReactionItem(
                              icon: Icons.code,
                              label: '1st Contributor',
                              future: _fetchFirstContributor(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Scattered Stars (in middle) - More stars with varied positions
                    for (var i = 0; i < 20; i++)
                      Positioned(
                        top: 10.0 + (i * 30),
                        left: (i % 3 == 0)
                            ? 15.0 + (i * 20)
                            : (i % 3 == 1)
                                ? 280.0 - (i * 15)
                                : 150.0 + (sin(i.toDouble()) * 100),
                        child: ShiningStarAnimation(
                          delay: i * 0.2,
                          size: 10 + (i % 4) * 3,
                          opacity: 0.3 + (i % 3) * 0.2,
                        ),
                      ),
                    // Crown Animation (in front) with shining effect
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Stack(
                        children: [
                          // Shining effect for crown
                          ShiningStarAnimation(
                            delay: 0.0,
                            size: 70,
                            opacity: 0.2,
                            icon: Icons.workspace_premium,
                          ),
                          // Main crown
                          RotationTransition(
                            turns: Tween(begin: -0.02, end: 0.02).animate(
                              CurvedAnimation(
                                parent: _controller,
                                curve: Curves.easeInOut,
                              ),
                            ),
                            child: Icon(
                              Icons.workspace_premium,
                              color: Colors.amber.withOpacity(0.9),
                              size: 60,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.blue[100]!,
                    width: 1,
                  ),
                ),
                child: const Text(
                  '✨ These amazing people were the first to interact with this repository! Their early support and contributions helped shape this project into what it is today.',
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Add this method to fetch first contributor
  Future<Map<String, String>> _fetchFirstContributor() async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://api.github.com/repos/The-Young-Programer/FlutterScreens/contributors'),
        headers: {'Accept': 'application/vnd.github.v3+json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> contributors = json.decode(response.body);
        if (contributors.isNotEmpty) {
          final firstContributor = contributors.first;
          return {
            'name': firstContributor['login'],
            'avatar': firstContributor['avatar_url'],
          };
        }
      }
    } catch (e) {
      print('Error fetching first contributor: $e');
    }
    return {
      'name': 'No contributors yet',
      'avatar': 'https://github.com/identicons/default.png'
    };
  }

  Widget _buildReactionItem({
    required IconData icon,
    required String label,
    required Future<Map<String, String>> future,
  }) {
    return FutureBuilder<Map<String, String>>(
      future: future,
      builder: (context, snapshot) {
        return Row(
          children: [
            Icon(icon, color: Colors.blue[700]),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (snapshot.hasData) ...[
                  const SizedBox(height: 4),
                  InkWell(
                    onTap: () {
                      if (snapshot.data!['name'] != 'No stars yet' &&
                          snapshot.data!['name'] != 'No comments yet' &&
                          snapshot.data!['name'] != 'No forks yet' &&
                          snapshot.data!['name'] != 'No contributors yet') {
                        launchUrl(Uri.parse(
                            'https://github.com/${snapshot.data!['name']}'));
                      }
                    },
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 12,
                          backgroundImage: NetworkImage(
                            snapshot.data!['avatar'] ?? '',
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          snapshot.data!['name'] ?? 'Loading...',
                          style: TextStyle(
                            color: snapshot.data!['name']?.startsWith('No ') ==
                                    true
                                ? Colors.grey[600]
                                : Colors.blue[700],
                            fontSize: 14,
                            decoration:
                                snapshot.data!['name']?.startsWith('No ') ==
                                        true
                                    ? TextDecoration.none
                                    : TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ] else
                  Text(
                    'Loading...',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
              ],
            ),
          ],
        );
      },
    );
  }

  Future<Map<String, String>> _fetchFirstStar() async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://api.github.com/repos/The-Young-Programer/FlutterScreens/stargazers'),
        headers: {'Accept': 'application/vnd.github.v3+json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> stargazers = json.decode(response.body);
        if (stargazers.isNotEmpty) {
          final firstStar = stargazers.first;
          return {
            'name': firstStar['login'],
            'avatar': firstStar['avatar_url'],
          };
        }
      }
    } catch (e) {
      print('Error fetching first star: $e');
    }
    return {
      'name': 'No stars yet',
      'avatar': 'https://github.com/identicons/default.png'
    };
  }

  Future<Map<String, String>> _fetchFirstComment() async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://api.github.com/repos/The-Young-Programer/FlutterScreens/issues?state=all'),
        headers: {'Accept': 'application/vnd.github.v3+json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> issues = json.decode(response.body);
        if (issues.isNotEmpty) {
          final firstIssue = issues.first;
          return {
            'name': firstIssue['user']['login'],
            'avatar': firstIssue['user']['avatar_url'],
          };
        }
      }
    } catch (e) {
      print('Error fetching first comment: $e');
    }
    return {
      'name': 'No comments yet',
      'avatar': 'https://github.com/identicons/default.png'
    };
  }

  Future<Map<String, String>> _fetchFirstFork() async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://api.github.com/repos/The-Young-Programer/FlutterScreens/forks'),
        headers: {'Accept': 'application/vnd.github.v3+json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> forks = json.decode(response.body);
        if (forks.isNotEmpty) {
          final firstFork = forks.first;
          return {
            'name': firstFork['owner']['login'],
            'avatar': firstFork['owner']['avatar_url'],
          };
        }
      }
    } catch (e) {
      print('Error fetching first fork: $e');
    }
    return {
      'name': 'No forks yet',
      'avatar': 'https://github.com/identicons/default.png'
    };
  }

  Widget _buildThirdPage() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Contributors',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'The amazing people who contributed to this project',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 24),
              FutureBuilder<List<Map<String, String>>>(
                future: _fetchContributors(),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final contributor = snapshot.data![index];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey[200]!),
                          ),
                          child: ListTile(
                            onTap: () {
                              launchUrl(Uri.parse(
                                  'https://github.com/${contributor['login']}'));
                            },
                            leading: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(contributor['avatar'] ?? ''),
                            ),
                            title: Text(
                              contributor['login'] ?? '',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[900],
                              ),
                            ),
                            subtitle: Text(
                              'Contributions: ${contributor['contributions']}',
                              style: TextStyle(
                                color: Colors.grey[600],
                              ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: Colors.grey[400],
                            ),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'Error loading contributors',
                        style: TextStyle(color: Colors.red[300]),
                      ),
                    );
                  }
                  // Loading skeleton with updated style
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey[200]!),
                        ),
                        child: ListTile(
                          leading: ShimmerLoading(
                            child: const CircleAvatar(
                              backgroundColor: Colors.white,
                            ),
                          ),
                          title: ShimmerLoading(
                            child: Container(
                              height: 14,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                          ),
                          subtitle: ShimmerLoading(
                            child: Container(
                              height: 12,
                              width: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<Map<String, String>>> _fetchContributors() async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://api.github.com/repos/The-Young-Programer/FlutterScreens/contributors'),
        headers: {'Accept': 'application/vnd.github.v3+json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> contributors = json.decode(response.body);
        return contributors
            .map((contributor) => {
                  'login': contributor['login'] as String,
                  'avatar': contributor['avatar_url'] as String,
                  'contributions': contributor['contributions'].toString(),
                })
            .toList();
      }
      throw Exception('Failed to load contributors');
    } catch (e) {
      print('Error fetching contributors: $e');
      throw Exception('Failed to load contributors');
    }
  }

  Widget _buildGithubStat({
    required IconData icon,
    required String label,
    required int count,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16),
            const SizedBox(width: 4),
            Text('$label ($count)', style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}

// Move these classes outside of _WelcomeScreenState
class ShiningStarAnimation extends StatefulWidget {
  final double delay;
  final double size;
  final double opacity;
  final IconData icon;

  const ShiningStarAnimation({
    Key? key,
    required this.delay,
    this.size = 20,
    this.opacity = 1.0,
    this.icon = Icons.star,
  }) : super(key: key);

  @override
  _ShiningStarAnimationState createState() => _ShiningStarAnimationState();
}

class _ShiningStarAnimationState extends State<ShiningStarAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    Future.delayed(Duration(milliseconds: (widget.delay * 1000).toInt()), () {
      if (mounted) {
        _controller.repeat(reverse: true);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Icon(
        widget.icon,
        color: Colors.amber.withOpacity(widget.opacity),
        size: widget.size,
      ),
    );
  }
}

class ShimmerLoading extends StatefulWidget {
  final Widget child;

  const ShimmerLoading({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  _ShimmerLoadingState createState() => _ShimmerLoadingState();
}

class _ShimmerLoadingState extends State<ShimmerLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat();
    _animation = Tween<double>(begin: -2, end: 2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.grey[300]!,
                Colors.grey[100]!,
                Colors.grey[300]!,
              ],
              stops: [
                0.0,
                0.5,
                1.0,
              ],
              transform: GradientRotation(_animation.value),
            ).createShader(bounds);
          },
          child: widget.child,
        );
      },
    );
  }
}
