import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/screens/setting.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/components/image_text_homepage.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/search_map_page.dart';

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
            image: AssetImage(
                'images/background_image.jpg'), // replace with your image
            fit: BoxFit.cover,
          ),
          color: const Color.fromARGB(85, 255, 255, 255)
              .withOpacity(0.5), // this makes the color white with 50% opacity
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 30.0, left: 10, right: 10, bottom: 10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              borderRadius: BorderRadius.circular(15.0), // Add this line
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
                  title2: 'Name 2',
                  image2: AssetImage('images/image2.jpg'),
                  onPressed2: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                RowImageText(
                  title1: 'Name 3',
                  image1: AssetImage('images/image3.jpg'),
                  onPressed1: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                  title2: 'Name 4',
                  image2: AssetImage('images/image4.jpg'),
                  onPressed2: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                RowImageText(
                  title1: 'Name 5',
                  image1: AssetImage('images/image5.jpeg'),
                  onPressed1: () {
                    Navigator.pushNamed(context, LoginScreen.id);
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
