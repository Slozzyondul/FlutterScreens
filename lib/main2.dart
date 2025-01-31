// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'buttons/buttons.dart';
import 'misc/rating.dart';
import 'loaders/loaders.dart';
import 'misc/graph.dart';
import 'screens/login_screen/login_screen.dart';
import 'screens/home_screen/home_screen.dart';
import 'screens/splash_screen/splash_screen.dart';
import 'screens/onboarding_screen/onboarding_screen.dart';
import 'screens/signUp_screen/signUp_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'booking.dart';
import 'screens/profile_screen/profile_screen.dart';
import 'screens/settings_screen/settings_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Template',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const MobileTemplate(),
      routes: {
        '/home': (context) => const MobileTemplate(),
      },
    );
  }
}

class Item {
  final int id;
  final String title;
  final String description;
  final String category;
  final bool isDisabled;

  Item({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    this.isDisabled = false,
  });
}

class MobileTemplate extends StatefulWidget {
  const MobileTemplate({Key? key}) : super(key: key);

  @override
  State<MobileTemplate> createState() => _MobileTemplateState();
}

class _MobileTemplateState extends State<MobileTemplate>
    with SingleTickerProviderStateMixin {
  late AnimationController _menuController;
  bool _isMenuOpen = false;
  String? selectedCategory;
  bool _isUIComponentsOpen = false;
  bool _isScreensOpen = false;

  final List<Item> items = [
    // Authentication
    Item(
      id: 1,
      title: 'Login Screen',
      description: 'User authentication interface',
      category: 'Authentication',
    ),
    Item(
      id: 2,
      title: 'Signup Screen',
      description: 'New user registration interface',
      category: 'Authentication',
    ),

    // Navigation Components
    Item(
      id: 3,
      title: 'App Bar',
      description: 'Standard app bar for navigation',
      category: 'Navigation Components',
    ),
    Item(
      id: 4,
      title: 'Drawer',
      description: 'Side navigation drawer',
      category: 'Navigation Components',
    ),
    Item(
      id: 5,
      title: 'Bottom Navigation Bar',
      description: 'Bottom navigation for quick access',
      category: 'Navigation Components',
    ),
    Item(
      id: 6,
      title: 'Tab Bar',
      description: 'Tab bar for switching between views',
      category: 'Navigation Components',
    ),

    // Layout Components
    Item(
      id: 7,
      title: 'List View',
      description: 'Scrollable list of items',
      category: 'Layout Components',
    ),
    Item(
      id: 8,
      title: 'Grid View',
      description: 'Grid layout for displaying items',
      category: 'Layout Components',
    ),
    Item(
      id: 9,
      title: 'Column',
      description: 'Column layout for vertical stacking',
      category: 'Layout Components',
    ),
    Item(
      id: 10,
      title: 'Row',
      description: 'Row layout for horizontal stacking',
      category: 'Layout Components',
    ),
    Item(
      id: 11,
      title: 'Container',
      description: 'Basic container widget',
      category: 'Layout Components',
    ),
    Item(
      id: 12,
      title: 'Divider',
      description: 'Divider for separating content',
      category: 'Layout Components',
    ),

    // Input Components
    Item(
      id: 13,
      title: 'Text Field',
      description: 'Input field for text',
      category: 'Input Components',
    ),
    Item(
      id: 14,
      title: 'Checkbox',
      description: 'Checkbox for boolean input',
      category: 'Input Components',
    ),
    Item(
      id: 15,
      title: 'Radio',
      description: 'Radio button for single selection',
      category: 'Input Components',
    ),
    Item(
      id: 16,
      title: 'Buttons',
      description: 'Various button styles and designs',
      category: 'Input Components',
    ),
    Item(
      id: 17,
      title: 'Form',
      description: 'Form for user input',
      category: 'Input Components',
    ),
    Item(
      id: 18,
      title: 'Slider',
      description: 'Slider for selecting a value',
      category: 'Input Components',
    ),
    Item(
      id: 19,
      title: 'Switch',
      description: 'Toggle switch for boolean input',
      category: 'Input Components',
    ),

    // Display Components
    Item(
      id: 20,
      title: 'Card',
      description: 'Material design card',
      category: 'Display Components',
    ),
    Item(
      id: 21,
      title: 'Circle Avatar',
      description: 'Circular avatar for user profile',
      category: 'Display Components',
    ),
    Item(
      id: 22,
      title: 'Chip',
      description: 'Chip for input or selection',
      category: 'Display Components',
    ),
    Item(
      id: 23,
      title: 'Page View',
      description: 'Swipeable page view',
      category: 'Display Components',
    ),
    Item(
      id: 24,
      title: 'Progress Indicator',
      description: 'Indicates progress of a task',
      category: 'Display Components',
    ),
    Item(
      id: 25,
      title: 'Snack Bar',
      description: 'Temporary message at the bottom',
      category: 'Display Components',
    ),
    Item(
      id: 26,
      title: 'Modal Bottom Sheet',
      description: 'Bottom sheet for modal content',
      category: 'Display Components',
    ),
    Item(
      id: 27,
      title: 'Popup Menu',
      description: 'Popup menu for options',
      category: 'Display Components',
    ),
    Item(
      id: 28,
      title: 'Stepper',
      description: 'Step-by-step navigation',
      category: 'Display Components',
    ),
    Item(
      id: 29,
      title: 'Expansion Panel',
      description: 'Expandable panel for content',
      category: 'Display Components',
    ),

    // Advanced UI Elements
    Item(
      id: 30,
      title: 'Carousel/Slider',
      description: 'Carousel for images or items',
      category: 'Advanced UI Elements',
    ),
    Item(
      id: 31,
      title: 'Timeline',
      description: 'Timeline for events',
      category: 'Advanced UI Elements',
    ),
    Item(
      id: 32,
      title: 'Rating UI',
      description: 'User rating interface',
      category: 'Advanced UI Elements',
    ),
    Item(
      id: 33,
      title: 'Search Bar',
      description: 'Search input field',
      category: 'Advanced UI Elements',
    ),
    Item(
      id: 34,
      title: 'Filter UI',
      description: 'UI for filtering items',
      category: 'Advanced UI Elements',
    ),

    // Startup Screens
    Item(
      id: 35,
      title: 'Splash Screen',
      description: 'Initial loading screen with app branding',
      category: 'Startup Screens',
    ),
    Item(
      id: 36,
      title: 'Onboarding Screen',
      description: 'User onboarding interface',
      category: 'Startup Screens',
    ),

    // Core App Screens
    Item(
      id: 37,
      title: 'Home Screen',
      description: 'Main app dashboard view',
      category: 'Core App Screens',
    ),
    Item(
      id: 38,
      title: 'Profile Screen',
      description: 'User profile management interface',
      category: 'Core App Screens',
    ),
    Item(
      id: 39,
      title: 'Settings Screen',
      description: 'Settings layout and components',
      category: 'Core App Screens',
    ),
    Item(
      id: 40,
      title: 'Dashboard Screen',
      description: 'Dashboard for user insights',
      category: 'Core App Screens',
    ),
    Item(
      id: 41,
      title: 'Notifications Screen',
      description: 'Screen for user notifications',
      category: 'Core App Screens',
    ),

    // Utility Screens
    Item(
      id: 42,
      title: 'Search Screen',
      description: 'Screen for searching items',
      category: 'Utility Screens',
    ),
    Item(
      id: 43,
      title: 'Chat Screen',
      description: 'Messaging interface',
      category: 'Utility Screens',
    ),
    Item(
      id: 44,
      title: 'Map/Location Screen',
      description: 'Screen for displaying maps',
      category: 'Utility Screens',
    ),
    Item(
      id: 45,
      title: 'Help/Support Screen',
      description: 'User support interface',
      category: 'Utility Screens',
    ),
    Item(
      id: 46,
      title: 'About Us Screen',
      description: 'Information about the app',
      category: 'Utility Screens',
    ),
    Item(
      id: 47,
      title: 'Terms and Conditions Screen',
      description: 'Legal terms for the app',
      category: 'Utility Screens',
    ),
    Item(
      id: 48,
      title: 'Feedback Screen',
      description: 'User feedback interface',
      category: 'Utility Screens',
    ),
    Item(
      id: 49,
      title: 'Error/404 Screen',
      description: 'Error handling screen',
      category: 'Utility Screens',
    ),
    Item(
      id: 50,
      title: 'Success/Confirmation Screen',
      description: 'Success message screen',
      category: 'Utility Screens',
    ),

    // E-commerce Screens
    Item(
      id: 51,
      title: 'Cart Screen',
      description: 'Shopping cart interface',
      category: 'E-commerce Screens',
    ),
    Item(
      id: 52,
      title: 'Checkout Screen',
      description: 'Checkout process interface',
      category: 'E-commerce Screens',
    ),
    Item(
      id: 53,
      title: 'Order Summary Screen',
      description: 'Summary of user orders',
      category: 'E-commerce Screens',
    ),

    // Activity Screens
    Item(
      id: 54,
      title: 'Activity/History Screen',
      description: 'User activity history',
      category: 'Activity Screens',
    ),
    Item(
      id: 55,
      title: 'Favorites/Wishlist Screen',
      description: 'User favorites and wishlist',
      category: 'Activity Screens',
    ),

    // Experimental
    Item(
      id: 56,
      title: 'Hero',
      description: 'Hero animation for transitions',
      category: 'Experimental',
    ),
    Item(
      id: 57,
      title: 'Gesture Detector',
      description: 'Detects gestures',
      category: 'Experimental',
    ),
    Item(
      id: 58,
      title: 'Animation Controller',
      description: 'Controls animations',
      category: 'Experimental',
    ),
    Item(
      id: 59,
      title: 'Custom Painter',
      description: 'Custom drawing on canvas',
      category: 'Experimental',
    ),
    Item(
      id: 60,
      title: 'Tooltip',
      description: 'Tooltip for additional information',
      category: 'Experimental',
    ),
    Item(
      id: 61,
      title: 'Animated Container',
      description: 'Container with animation',
      category: 'Experimental',
    ),
    Item(
      id: 62,
      title: 'Animated Opacity',
      description: 'Opacity animation',
      category: 'Experimental',
    ),
    Item(
      id: 63,
      title: 'Animated Positioned',
      description: 'Positioned widget with animation',
      category: 'Experimental',
    ),
    Item(
      id: 64,
      title: 'Animated Cross Fade',
      description: 'Cross fade animation',
      category: 'Experimental',
    ),
    Item(
      id: 65,
      title: 'Animated List',
      description: 'List with animations',
      category: 'Experimental',
    ),

    // Adv. Features
    Item(
      id: 66,
      title: 'REST API Integration',
      description: 'Integration with REST APIs',
      category: 'Adv. Features',
    ),
    Item(
      id: 67,
      title: 'GraphQL API Integration',
      description: 'Integration with GraphQL APIs',
      category: 'Adv. Features',
    ),
    Item(
      id: 68,
      title: 'WebSocket Connections',
      description: 'Real-time WebSocket connections',
      category: 'Adv. Features',
    ),
    Item(
      id: 69,
      title: 'Firebase Integration',
      description: 'Integration with Firebase services',
      category: 'Adv. Features',
    ),
    Item(
      id: 70,
      title: 'Payment Integration',
      description: 'Payment processing integration',
      category: 'Adv. Features',
    ),
    Item(
      id: 71,
      title: 'Push Notifications',
      description: 'Push notifications setup',
      category: 'Adv. Features',
    ),
    Item(
      id: 72,
      title: 'Data Visualization',
      description: 'Visual representation of data',
      category: 'Adv. Features',
    ),
  ];

  final List<String> menuCategories = [
    'All Categories',
    'Authentication',
    'Components',
    'Experimental',
    'Screens',
    'UI',
  ];

  @override
  void initState() {
    super.initState();
    _menuController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _menuController.dispose();
    super.dispose();
  }

  void toggleMenu() {
    setState(() {
      _isMenuOpen = !_isMenuOpen;
      if (_isMenuOpen) {
        _menuController.forward();
      } else {
        _menuController.reverse();
      }
    });
  }

  String searchTerm = '';
  String filterTerm = '';

  List<Item> get filteredItems {
    return items.where((item) {
      final matchesSearch =
          item.title.toLowerCase().contains(searchTerm.toLowerCase()) ||
              item.description.toLowerCase().contains(searchTerm.toLowerCase());

      bool matchesCategory = true;
      if (selectedCategory != null) {
        // Add mapping for subcategories to main categories
        if (selectedCategory!.contains('Components') ||
            selectedCategory!.contains('Screens')) {
          matchesCategory =
              item.category == 'Components' || item.category == 'Screens';
        } else {
          matchesCategory = item.category == selectedCategory;
        }
      }

      return matchesSearch && matchesCategory;
    }).toList();
  }

  List<String> get categories {
    return items.map((item) => item.category).toSet().toList();
  }

  void navigateToScreen(
      BuildContext context, String screenName, bool isDisabled) {
    print('Navigating to: $screenName');
    if (isDisabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('This screen is coming soon!'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    switch (screenName) {
      case 'Splash Screen':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SplashScreenShowcase()),
        );
        break;
      case 'Signup Screen':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SignUpScreenShowcase()),
        );
        break;
      case 'Buttons':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ButtonExample()),
        );
        break;
      case 'Loaders':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoadersExample()),
        );
        break;
      case 'Misc':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MiscShowcase()),
        );
        break;
      case 'Experiment':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Graph()),
        );
        break;
      case 'Login Screen':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreenShowcase()),
        );
        break;
      case 'Home Screen':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
        break;
      case 'Settings':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SettingsScreen()),
        );
        break;
      case 'Profile':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileScreenShowcase()),
        );
        break;
      default:
        final path = screenName.replaceAll(' ', '').replaceAll('/', '');
        final routePath =
            'lib/screens/${path.toLowerCase()}/${path.toLowerCase()}.dart';
        print('Navigating to: $routePath');

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Would navigate to: $routePath'),
            duration: const Duration(seconds: 2),
          ),
        );
    }
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  void handleCategorySelection(String category) {
    setState(() {
      selectedCategory = category == 'All Categories' ? null : category;
      _isMenuOpen = false;
      _isUIComponentsOpen = false;
      _isScreensOpen = false;
      _menuController.reverse();
    });
    Navigator.pop(context);
  }

  PopupMenuEntry<String> buildSubmenuItem(String title) {
    return PopupMenuItem<String>(
      value: title,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.grey[800],
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget buildMenu() {
    return PopupMenuButton<String>(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_close,
        progress: _menuController,
        color: Colors.grey[900],
      ),
      color: Colors.white,
      constraints: const BoxConstraints(minWidth: 250),
      position: PopupMenuPosition.under,
      onOpened: () {
        setState(() {
          _isMenuOpen = true;
          _menuController.forward();
        });
      },
      onCanceled: () {
        setState(() {
          _isMenuOpen = false;
          _isUIComponentsOpen = false;
          _isScreensOpen = false;
          _menuController.reverse();
        });
      },
      itemBuilder: (BuildContext context) => [
        const PopupMenuItem<String>(
          value: 'All Categories',
          child: Text('All Categories'),
        ),
        const PopupMenuItem<String>(
          value: 'Authentication',
          child: Text('Authentication'),
        ),

        // UI Components Dropdown Header
        PopupMenuItem<String>(
          height: 40,
          child: InkWell(
            onTap: () {
              setState(() {
                _isUIComponentsOpen = !_isUIComponentsOpen; // Toggle dropdown
                _isScreensOpen = false; // Close other dropdown
              });
            },
            child: Row(
              children: [
                const Text('UI Components'),
                const Spacer(),
                Icon(
                  _isUIComponentsOpen
                      ? Icons.arrow_drop_down
                      : Icons.arrow_right,
                  color: Colors.grey[600],
                ),
              ],
            ),
          ),
        ),

        // UI Components Submenu
        if (_isUIComponentsOpen) ...[
          buildSubmenuItem('Navigation Components'),
          buildSubmenuItem('Layout Components'),
          buildSubmenuItem('Input Components'),
          buildSubmenuItem('Display Components'),
          buildSubmenuItem('Advanced UI Elements'),
        ],

        // Screens Dropdown Header
        PopupMenuItem<String>(
          height: 40,
          child: InkWell(
            onTap: () {
              setState(() {
                _isScreensOpen = !_isScreensOpen; // Toggle dropdown
                _isUIComponentsOpen = false; // Close other dropdown
              });
            },
            child: Row(
              children: [
                const Text('Screens'),
                const Spacer(),
                Icon(
                  _isScreensOpen ? Icons.arrow_drop_down : Icons.arrow_right,
                  color: Colors.grey[600],
                ),
              ],
            ),
          ),
        ),

        // Screens Submenu
        if (_isScreensOpen) ...[
          buildSubmenuItem('Startup Screens'),
          buildSubmenuItem('Core App Screens'),
          buildSubmenuItem('Utility Screens'),
          buildSubmenuItem('E-commerce Screens'),
          buildSubmenuItem('Activity Screens'),
        ],

        const PopupMenuItem<String>(
          value: 'Experimental',
          child: Text('Experimental'),
        ),
        const PopupMenuItem<String>(
          value: 'Adv. Features',
          child: Text('Adv. Features'),
        ),

        // Keep existing divider and contact section
        const PopupMenuItem<String>(
          enabled: false,
          child: Divider(),
        ),

        // Keep existing contact section and booking button
        PopupMenuItem<String>(
          enabled: false,
          child: Text(
            'Contact',
            style: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // Keep existing Social Icons
        PopupMenuItem<String>(
          enabled: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.githubAlt, size: 24),
                onPressed: () =>
                    _launchURL('https://github.com/The-Young-Programer'),
              ),
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.linkedinIn, size: 24),
                onPressed: () =>
                    _launchURL('https://www.linkedin.com/in/typ-nemonet'),
              ),
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.envelope, size: 24),
                onPressed: () => _launchURL('mailto:nemonettyp@gmail.com'),
              ),
            ],
          ),
        ),
        const PopupMenuItem<String>(
          enabled: false,
          child: Divider(),
        ),
        // Keep existing Booking Button
        PopupMenuItem<String>(
          enabled: false,
          child: Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookingPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text(
                'Booking',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
      onSelected: (String value) {
        // Handle category selection
        setState(() {
          if (value == 'All Categories') {
            selectedCategory = null; // Show all items
          } else {
            selectedCategory = value; // Set selected category
          }
          _isMenuOpen = false;
          _isUIComponentsOpen = false;
          _isScreensOpen = false;
          _menuController.reverse();
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.grey[900]),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/');
          },
        ),
        title: Text(
          'Flutter UI Screens',
          style: TextStyle(
            color: Colors.grey[900],
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          buildMenu(),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 3,
                      child: TextField(
                        onChanged: (value) =>
                            setState(() => searchTerm = value),
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          prefixIcon:
                              Icon(Icons.search, color: Colors.grey[400]),
                          filled: true,
                          fillColor: Colors.white,
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 12,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey[200]!),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey[200]!),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BookingPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text(
                          'Booking',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              if (selectedCategory != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    children: [
                      Text(
                        'Category: $selectedCategory',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[900],
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            selectedCategory = null;
                          });
                        },
                        child: const Text('Clear'),
                      ),
                    ],
                  ),
                ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.5,
                  ),
                  itemCount: filteredItems.length,
                  itemBuilder: (context, index) {
                    final item = filteredItems[index];

                    return InkWell(
                      onTap: () {
                        navigateToScreen(
                          context,
                          item.title,
                          item.isDisabled,
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey[200]!),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              item.title,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[900],
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              item.description,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
