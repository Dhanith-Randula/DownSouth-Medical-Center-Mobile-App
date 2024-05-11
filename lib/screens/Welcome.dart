import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/widgets.dart';

const colorizeColors = [
  Color.fromARGB(255, 0, 0, 0),
  Colors.blue,
  Color.fromARGB(255, 255, 255, 255),
  Colors.red,
];

const colorizeTextStyle = TextStyle(
    fontSize: 50.0, fontFamily: 'Horizon', fontWeight: FontWeight.bold);

class WelcomePage extends StatelessWidget {
  static const String id = 'welcome_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://images.pexels.com/photos/2422497/pexels-photo-2422497.jpeg?auto=compress&cs=tinysrgb&w=600'),

            // 'images/background_image.jpg'), // Replace with your background image path
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Color.fromARGB(90, 255, 255, 255).withOpacity(0.5),
                BlendMode.darken),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 100),
              DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 25.0,
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
              Hero(
                tag: 'logo',
                child: Container(
                  height: 100.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              SizedBox(height: 25),
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
              SizedBox(height: 25),
              SizedBox(
                width: 300.0,
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Bobbers',
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText(
                          'Tourists venturing through the enchanting landscapes of the South can now seamlessly navigate their health needs. With our user-friendly platform,finding nearby medical centers and arranging appointments is hassle-free,leaving you more time to explore and enjoy your travels.......',
                          textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, WelcomeScreen.id);
                    // Handle button press
                  },
                  child: Text('Let\'s Start'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
