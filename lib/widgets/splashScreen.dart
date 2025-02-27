import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/welcomeScreen.dart'; // Correct import path

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Navigate to WelcomeScreen after a short delay
    Future.delayed(const Duration(milliseconds: 100), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WelcomeScreen()),
      );
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
          'lib/assets/images/RiseLogo.png',
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}
