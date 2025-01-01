import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Booking',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: BookingPage(),
    );
  }
}

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final _formKey = GlobalKey<FormState>();
  final ScrollController _scrollController = ScrollController();
  bool _isSubmitting = false; // To control the submitting state
  String? selectedService;
  String? projectDescription;
  String? name;
  String? email;
  String? submissionMessage; // To hold the submission message

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking'),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // Center the column
          children: [
            Text(
              'Welcome to Our Booking Page!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center, // Center the welcome text
            ),
            SizedBox(height: 10),
            Text(
              'We are excited to help you bring your mobile app ideas to life. Please provide the details of your project below.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center, // Center the description text
            ),
            SizedBox(height: 40),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  _buildDropdownField(
                    label: 'Select Your Service',
                    items: [
                      'Mobile App Development',
                      'UI Component Design',
                      'Widget Development',
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedService = value;
                      });
                    },
                  ),
                  _buildTextField(
                    label: 'Your Project Description',
                    onChanged: (value) {
                      projectDescription = value;
                    },
                    maxLines: 3,
                  ),
                  _buildTextField(
                    label: 'Name',
                    onChanged: (value) {
                      name = value;
                    },
                  ),
                  _buildTextField(
                    label: 'Email',
                    onChanged: (value) {
                      email = value;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _isSubmitting // Disable button if submitting
                        ? null
                        : () {
                            if (_formKey.currentState?.validate() ?? false) {
                              setState(() {
                                _isSubmitting = true; // Start submitting
                                submissionMessage =
                                    null; // Clear previous message
                              });

                              // Simulate a delay for submission
                              Future.delayed(Duration(seconds: 2), () {
                                // Show success message
                                setState(() {
                                  submissionMessage =
                                      'Form submitted successfully';
                                  _isSubmitting =
                                      false; // Reset submitting state
                                  // Clear user input
                                  selectedService = null;
                                  projectDescription = null;
                                  name = null;
                                  email = null;

                                  // Clear the form fields
                                  _formKey.currentState?.reset();
                                });

                                // Clear success message after 3 seconds
                                Future.delayed(Duration(seconds: 3), () {
                                  setState(() {
                                    submissionMessage = null;
                                  });
                                });
                              });
                            }
                          },
                    child: _isSubmitting
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(), // Show loading indicator
                              SizedBox(width: 10),
                              Text('Submitting...'),
                            ],
                          )
                        : Text('Submit', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      minimumSize: Size(double.infinity, 50), // Wide button
                    ),
                  ),
                  SizedBox(height: 20),
                  if (submissionMessage != null) // Display submission message
                    Center(
                      child: Text(
                        submissionMessage!,
                        style: TextStyle(fontSize: 16, color: Colors.green),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  SizedBox(height: 20), // Add space for footer
                  Text(
                    'Thank you for reaching out! \n'
                    'We will review your submission as soon as possible.',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownField({
    required String label,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
          filled: true,
          fillColor: Colors.white,
        ),
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: onChanged,
        validator: (value) => value == null ? 'Please select an option' : null,
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required ValueChanged<String> onChanged,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0), // Added border radius
          ),
        ),
        onChanged: (value) {
          onChanged(value);
          // Remove error message if input is valid
          if (_formKey.currentState?.validate() ?? false) {
            _formKey.currentState?.validate();
          }
        },
        maxLines: maxLines,
        validator: (value) => value!.isEmpty ? 'Please enter a value' : null,
      ),
    );
  }
}
