import 'package:flash_chat/screens/home_page.dart';
import 'package:flash_chat/screens/search_map_page.dart';
import 'package:flutter/material.dart';

import 'package:flash_chat/screens/setting.dart';
import 'package:flash_chat/screens/signin_screen.dart';
import 'package:flash_chat/screens/signup_screen.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/forget_passsword_screen.dart';
import 'package:flash_chat/screens/find_medical_center.dart';
import 'package:flash_chat/screens/myAppoinment.dart';
import 'package:flash_chat/screens/emergency.dart';
import 'package:flash_chat/screens/appointmentPage(Book Now).dart';
import 'package:flash_chat/screens/AccountDetails.dart';
import 'package:flash_chat/screens/support.dart';
import 'package:flash_chat/screens/terms.dart';
import 'package:flash_chat/screens/aboutus.dart';

// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:geolocator/geolocator.dart';
// import 'dart:async';
// import 'dart:developer' as dev;

void main() => runApp(MedicalCenter());

class MedicalCenter extends StatelessWidget {
  const MedicalCenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        HomePage.id: (context) => HomePage(),
        CustomerDashboardPage.id: (context) => CustomerDashboardPage(),
        SettingsPage.id: (context) => SettingsPage(),
        FindMedicalCenter.id: (context) => FindMedicalCenter(),
        MyAppoinment.id: (context) => MyAppoinment(),
        SignInScreen.id: (context) => SignInScreen(),
        ForgetPasswordScreen.id: (context) => ForgetPasswordScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        EmergencyDetailsPage.id: (context) => EmergencyDetailsPage(),
        AppointmentPage.id: (context) => AppointmentPage(),
        AccountDetails.id: (context) => AccountDetails(),
        SupportPage.id: (context) => SupportPage(),
        TermsPage.id: (context) => TermsPage(),
        AboutUsPage.id: (context) => AboutUsPage(),
      },
    );
  }
}
