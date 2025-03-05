import 'package:flutter/material.dart';
import '../screens/login.dart'; // Import your login screen

class RiseWelcomeScreen extends StatefulWidget {
  const RiseWelcomeScreen({Key? key}) : super(key: key);

  @override
  _RiseWelcomeScreenState createState() => _RiseWelcomeScreenState();
}

class _RiseWelcomeScreenState extends State<RiseWelcomeScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to LoginScreen after 3 seconds
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF131314),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('lib/assets/images/ayubowan.png', width: 200),
            ],
          ),
        ),
      ),
    );
  }
}
