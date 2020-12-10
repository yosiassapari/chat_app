import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(duration: Duration(seconds: 1), vsync: this);
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white).animate(controller);
    controller.forward();

    controller.addListener(() {
      setState(() {
        // print(animation.value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var children2 = <Widget>[
      Row(
        children: <Widget>[
          Hero(
            tag: 'logo',
            child: Container(
              child: Image.asset('images/logo.png'),
              height: 60.0,
            ),
          ),
          TypewriterAnimatedTextKit(
            text: ['Flash Chat'],
            textStyle: TextStyle(
              fontSize: 45.0,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
      SizedBox(
        height: 48.0,
      ),
      RoundedButton(
        title: 'Login',
        colour: Colors.lightBlueAccent,
        onPressed: () {
          //Go to login screen.
          Navigator.pushNamed(context, LoginScreen.id);
        },
      ),
      RoundedButton(
        title: 'Register',
        colour: Colors.blueAccent,
        onPressed: () {
          //Go to login screen.
          Navigator.pushNamed(context, RegistrationScreen.id);
        },
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: children2,
        ),
      ),
    );
  }
}
