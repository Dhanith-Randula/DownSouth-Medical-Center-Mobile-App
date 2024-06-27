import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/screens/setting.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/components/image_text_homepage.dart';
import 'package:flash_chat/screens/signin_screen.dart';
import 'package:flash_chat/screens/find_medical_center.dart';
import 'package:flash_chat/screens/myAppoinment.dart';
import 'package:flash_chat/screens/aboutus.dart';

import 'package:flash_chat/screens/search_map_page.dart';
import 'package:flash_chat/screens/emergency.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home_page';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        duration: Duration(seconds: 1), vsync: this, upperBound: 100.0);
    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);

    controller.forward();

    controller.addListener(() {
      setState(() {});
      print(controller.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background_image.jpg'),
            fit: BoxFit.cover,
          ),
          color: const Color.fromARGB(85, 255, 255, 255).withOpacity(0.5),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 30.0, left: 10, right: 10, bottom: 10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              borderRadius: BorderRadius.circular(15.0),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 50.0, left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Hero(
                        tag: 'logo',
                        child: Container(
                          child: Image.asset('images/logo.png'),
                          height: controller.value,
                        ),
                      ),
                      AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            'MEDICAL CENTER',
                            textStyle: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                RowImageText(
                  title1: 'SEARCH',
                  image1: AssetImage('images/image1.jpg'),
                  onPressed1: () {
                    Navigator.pushNamed(context, CustomerDashboardPage.id);
                  },
                  title2: 'FIND MEDICAL CENTER',
                  image2: AssetImage('images/image2.jpg'),
                  onPressed2: () {
                    Navigator.pushNamed(context, FindMedicalCenter.id);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                RowImageText(
                  title1: 'MY APPOINMENT',
                  image1: AssetImage('images/image3.jpg'),
                  onPressed1: () {
                    Navigator.pushNamed(context, MyAppoinment.id);
                  },
                  title2: 'EMERGENCY',
                  image2: AssetImage('images/image4.jpg'),
                  onPressed2: () {
                    Navigator.pushNamed(context, EmergencyDetailsPage.id);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                RowImageText(
                  title1: 'ABOUT US',
                  image1: AssetImage('images/image5.jpeg'),
                  onPressed1: () {
                    Navigator.pushNamed(context, AboutUsPage.id);
                  },
                  title2: 'SETTING',
                  image2: AssetImage('images/setting.png'),
                  onPressed2: () {
                    Navigator.pushNamed(context, SettingsPage.id);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
