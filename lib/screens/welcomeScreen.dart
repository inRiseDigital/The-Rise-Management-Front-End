import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'login.dart'; // Import the login screen

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  final List<Particle> particles = [];
  static const numberOfParticles = 50;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5), // Set the duration to 5 seconds
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    // Initialize particles
    for (int i = 0; i < numberOfParticles; i++) {
      particles.add(Particle());
    }

    _controller.addListener(() {
      if (_controller.value > 0.5) {
        for (var particle in particles) {
          particle.update();
        }
        setState(() {});
      }
    });

    _controller.forward();

    // Navigate to login screen after 5 seconds
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF131314), Color(0xFF1F1F1F)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // Particles
          if (_controller.value > 0.5) ...[
            ...particles.map(
              (particle) => Positioned(
                left: particle.x,
                top: particle.y,
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: Container(
                    width: 2,
                    height: 2,
                    decoration: BoxDecoration(
                      color: particle.color,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
          ],
          // Logo and Text
          Center(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'lib/assets/images/RiseLogo.png',
                    width: 150,
                    height: 150,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'The Rise',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
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

class Particle {
  late double x;
  late double y;
  late double speedX;
  late double speedY;
  late Color color;
  late Animation<double> opacity;

  static final random = math.Random();

  Particle() {
    reset();
    x = random.nextDouble() * 400;
    y = random.nextDouble() * 800;
  }

  void reset() {
    x = 200 + random.nextDouble() * 20 - 10;
    y = 400 + random.nextDouble() * 20 - 10;
    speedX = random.nextDouble() * 4 - 2;
    speedY = random.nextDouble() * 4 - 2;
    color = Colors.white.withOpacity(0.6);
  }

  void update() {
    x += speedX;
    y += speedY;

    if (x < 0 || x > 400 || y < 0 || y > 800) {
      reset();
    }
  }
}
