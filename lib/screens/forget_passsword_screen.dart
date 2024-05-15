import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatefulWidget {
  static const String id = 'fogetPassword_screen';
  const ForgetPasswordScreen();

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return const Text('Forget Password');
  }
}
