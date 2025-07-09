import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  //static is used because its same for all cases no matter the object's different features
  //just to get single property of class without having to create an object
  // can also be used for methods that is used from class without having to make object

  static const String id = 'welcome_screen';

  const WelcomeScreen({super.key});
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
    animation = ColorTween(
      begin: Colors.blueGrey,
      end: Colors.white,
    ).animate(controller);

    //  animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 60,
                    //   height: animation.value * 100,
                    child: Image.asset('images/logo.png'),
                  ),
                ),

                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Flash Chat',
                      textStyle: TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.grey[700],
                      ),
                      speed: Duration(milliseconds: 200),
                    ),
                  ],
                  totalRepeatCount: 1,
                  pause: Duration(milliseconds: 1000),
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                ),
              ],
            ),
            SizedBox(height: 48.0),
            RoundedButton(
              colour: Colors.lightBlueAccent,
              title: 'Log In',
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundedButton(
              colour: Colors.blueAccent,
              title: 'Register',
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
