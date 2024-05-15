import 'package:flash_chat/screens/home_page.dart';
import 'package:flash_chat/screens/search_map_page.dart';
import 'package:flutter/material.dart';

import 'package:flash_chat/screens/setting.dart';
import 'package:flash_chat/screens/signin_screen.dart';
import 'package:flash_chat/screens/signup_screen.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/forget_passsword_screen.dart';

void main() => runApp(MedicalCenter());

class MedicalCenter extends StatelessWidget {
  const MedicalCenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomePage.id,
      routes: {
        HomePage.id: (context) => HomePage(),
        CustomerDashboardPage.id: (context) => CustomerDashboardPage(),
        SettingsPage.id: (context) => SettingsPage(),

        
        SignInScreen.id: (context) => SignInScreen(),
        ForgetPasswordScreen.id: (context) => ForgetPasswordScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
      },
    );
  }
}
