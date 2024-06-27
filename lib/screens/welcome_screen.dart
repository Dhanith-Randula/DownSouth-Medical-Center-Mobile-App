import 'package:flutter/material.dart';
import 'package:flash_chat/screens/signin_screen.dart';
import 'package:flash_chat/screens/signup_screen.dart';
import 'package:flash_chat/theme/theme.dart';
import 'package:flash_chat/components/custom_scaffold.dart';
import 'package:flash_chat/components/welcome_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

const colorizeColors = [
  Color.fromARGB(255, 255, 255, 255),
  Colors.blue,
  Color.fromARGB(255, 68, 68, 68),
  Colors.red,
];

const colorizeTextStyle = TextStyle(
    fontSize: 30.0, fontFamily: 'Horizon', fontWeight: FontWeight.bold);

class WelcomeScreen extends StatelessWidget {
  static const String id = 'Wel_screen';
  const WelcomeScreen();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          DefaultTextStyle(
            style: const TextStyle(
              fontSize: 40.0,
              color: Color.fromARGB(255, 255, 255, 255),
              fontFamily: 'Cinzel',
              fontWeight: FontWeight.bold,
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                WavyAnimatedText('WELCOME ....'),
              ],
              isRepeatingAnimation: true,
            ),
          ),
          SizedBox(height: 50),
          AnimatedTextKit(
            animatedTexts: [
              ColorizeAnimatedText(
                'DOWNSOUTH MEDICAL CENTER',
                textStyle: colorizeTextStyle,
                textAlign: TextAlign.center,
                colors: colorizeColors,
              ),
            ],
            isRepeatingAnimation: true,
          ),
          Hero(
            tag: 'logo',
            child: Container(
              height: 150.0,
              child: Image.asset('images/logo.png'),
            ),
          ),
          SizedBox(
            height: 55.0,
          ),
          Text(
            'Tourists venturing through the enchanting landscapes of the South can now seamlessly navigate their health needs. With our user-friendly platform,finding nearby medical centers and arranging appointments is hassle-free,leaving you more time to explore and enjoy your travels.......',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontFamily: 'Bobbers',
              fontWeight: FontWeight.w600,
            ),
          ),
          Flexible(
            flex: 10,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Row(
                children: [
                  const Expanded(
                    child: WelcomeButton(
                      buttonText: 'Sign in',
                      onTap: const SignInScreen(),
                      color: Colors.transparent,
                      textColor: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: WelcomeButton(
                      buttonText: 'Sign up',
                      onTap: const SignUpScreen(),
                      color: Colors.white,
                      textColor: lightColorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
