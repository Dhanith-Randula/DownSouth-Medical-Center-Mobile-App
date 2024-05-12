import 'package:flash_chat/screens/home_page.dart';
import 'package:flash_chat/screens/search_map_page.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/Welcome.dart';
import 'package:flash_chat/screens/setting.dart';

void main() => runApp(MedicalCenter());

class MedicalCenter extends StatelessWidget {
  const MedicalCenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SettingsPage.id,
      routes: {
        WelcomePage.id: (context) => WelcomePage(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        HomePage.id: (context) => HomePage(),
        CustomerDashboardPage.id: (context) => CustomerDashboardPage(),
        SettingsPage.id: (context) => SettingsPage(),
      },
    );
  }
}
