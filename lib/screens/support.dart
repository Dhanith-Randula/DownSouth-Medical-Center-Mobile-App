import 'package:flutter/material.dart';

class SupportPage extends StatelessWidget {
  static const String id = 'SupportPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Support'),
      ),
      body: Center(
        child: Text(
          'Welcome to the Support Page!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
