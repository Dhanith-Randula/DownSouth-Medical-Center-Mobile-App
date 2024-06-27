import 'package:flutter/material.dart';

class SupportPage extends StatelessWidget {
  static const String id = 'SupportPage';

  // Contact support details
  final String email = 'support@example.com';
  final String phoneNumber = '+1 123-456-7890';
  final bool isLiveChatAvailable = true;
  final String operatingHours = 'Mon-Fri, 9:00 AM - 5:00 PM';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Support'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to the Support Page!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Text('Contact Support:', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Email: $email'),
            Text('Phone: $phoneNumber'),
            if (isLiveChatAvailable) Text('Live Chat: Available'),
            Text('Operating Hours: $operatingHours'),
          ],
        ),
      ),
    );
  }
}
