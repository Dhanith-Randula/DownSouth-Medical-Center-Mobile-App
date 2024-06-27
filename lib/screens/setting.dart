import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components/settingList.dart';
import 'package:flash_chat/screens/signin_screen.dart';
import 'package:flash_chat/screens/AccountDetails.dart';
import 'package:flash_chat/screens/support.dart';
import 'package:flash_chat/screens/terms.dart';

class SettingsPage extends StatefulWidget {
  static const String id = 'setting_screen';
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
        child: Container(
          color: Color.fromARGB(113, 255, 255, 255).withOpacity(0.4),
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 87, 86, 86).withOpacity(0.4),
                borderRadius: BorderRadius.circular(15.0),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color:
                            Color.fromARGB(132, 175, 175, 175).withOpacity(0.3),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, left: 10, right: 10),
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.arrow_back,
                                  color: Colors.black, size: 30.0),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                            AnimatedTextKit(
                              animatedTexts: [
                                TypewriterAnimatedText('SETTINGS',
                                    textStyle: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.center),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  settingList(
                    title: 'Acount Details',
                    onPressed: () {
                      Navigator.pushNamed(context, AccountDetails.id);
                    },
                  ),
                  settingList(
                    title: 'Security & Privacy',
                    onPressed: () {},
                  ),
                  settingList(
                    title: 'Report a Problem',
                    onPressed: () {},
                  ),
                  settingList(
                    title: 'Support',
                    onPressed: () {
                      Navigator.pushNamed(context, SupportPage.id);
                    },
                  ),
                  settingList(
                    title: 'Terms & Privacy Policy',
                    onPressed: () {
                      Navigator.pushNamed(context, TermsPage.id);
                    },
                  ),
                  settingList(
                    title: 'Log Out',
                    onPressed: () {
                      Navigator.pushNamed(context, SignInScreen.id);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
