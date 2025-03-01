// import 'package:flutter/material.dart';
// import 'dart:math' as math;
// import 'login.dart'; // Import the login screen

// class WelcomeScreen extends StatefulWidget {
//   const WelcomeScreen({Key? key}) : super(key: key);

//   @override
//   State<WelcomeScreen> createState() => _WelcomeScreenState();
// }

// class _WelcomeScreenState extends State<WelcomeScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _fadeAnimation;
//   final List<Particle> particles = [];
//   static const numberOfParticles = 50;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(seconds: 5), // Set the duration to 5 seconds
//       vsync: this,
//     );

//     _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
//       ),
//     );

//     // Initialize particles
//     for (int i = 0; i < numberOfParticles; i++) {
//       particles.add(Particle());
//     }

//     _controller.addListener(() {
//       if (_controller.value > 0.5) {
//         for (var particle in particles) {
//           particle.update();
//         }
//         setState(() {});
//       }
//     });

//     _controller.forward();

//     // Navigate to login screen after 5 seconds
//     Future.delayed(const Duration(seconds: 5), () {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const LoginScreen()),
//       );
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Background gradient
//           Container(
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Color(0xFF131314), Color(0xFF1F1F1F)],
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//               ),
//             ),
//           ),
//           // Particles
//           if (_controller.value > 0.5) ...[
//             ...particles.map(
//               (particle) => Positioned(
//                 left: particle.x,
//                 top: particle.y,
//                 child: FadeTransition(
//                   opacity: _fadeAnimation,
//                   child: Container(
//                     width: 2,
//                     height: 2,
//                     decoration: BoxDecoration(
//                       color: particle.color,
//                       shape: BoxShape.circle,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//           // Logo and Text
//           Center(
//             child: FadeTransition(
//               opacity: _fadeAnimation,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset(
//                     'lib/assets/images/RiseLogo.png',
//                     width: 150,
//                     height: 150,
//                   ),
//                   const SizedBox(height: 20),
//                   const Text(
//                     'The Rise',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 32,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Particle {
//   late double x;
//   late double y;
//   late double speedX;
//   late double speedY;
//   late Color color;
//   late Animation<double> opacity;

//   static final random = math.Random();

//   Particle() {
//     reset();
//     x = random.nextDouble() * 400;
//     y = random.nextDouble() * 800;
//   }

//   void reset() {
//     x = 200 + random.nextDouble() * 20 - 10;
//     y = 400 + random.nextDouble() * 20 - 10;
//     speedX = random.nextDouble() * 4 - 2;
//     speedY = random.nextDouble() * 4 - 2;
//     color = Colors.white.withOpacity(0.6);
//   }

//   void update() {
//     x += speedX;
//     y += speedY;

//     if (x < 0 || x > 400 || y < 0 || y > 800) {
//       reset();
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'login.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeIn),
      ),
    );

    _slideAnimation = Tween<double>(begin: 30.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 0.8, curve: Curves.easeOut),
      ),
    );

    _controller.forward();

    // Navigate to login screen after animation completes
    Future.delayed(const Duration(milliseconds: 4000), () {
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
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0F0F0F), Color(0xFF1F1F1F)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _slideAnimation.value),
                child: Opacity(
                  opacity: _fadeAnimation.value,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Logo with subtle shadow
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.1),
                              blurRadius: 15,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Image.asset(
                          'lib/assets/images/RiseLogo.png',
                          width: 150,
                          height: 150,
                        ),
                      ),
                      const SizedBox(height: 40),

                      // Title with larger, more modern text style
                      const Text(
                        'THE RISE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 42, // Increased size
                          fontWeight: FontWeight.w800, // More pronounced weight
                          letterSpacing:
                              6.0, // Increased letter spacing for modern look
                          fontFamily: 'Helvetica', // Modern system font
                          height: 0.9, // Tighter line height
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

// Updated Splash Screen with simple fade animation
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.forward();

    // Navigate to WelcomeScreen after animation completes
    Future.delayed(const Duration(milliseconds: 1500), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WelcomeScreen()),
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
      backgroundColor: Colors.black,
      body: Center(
        child: FadeTransition(
          opacity: _opacityAnimation,
          child: Image.asset(
            'lib/assets/images/RiseLogo.png',
            width: 150,
            height: 150,
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'login.dart';

// // ---------------------- WelcomeScreen ----------------------
// class WelcomeScreen extends StatefulWidget {
//   const WelcomeScreen({Key? key}) : super(key: key);

//   @override
//   State<WelcomeScreen> createState() => _WelcomeScreenState();
// }

// class _WelcomeScreenState extends State<WelcomeScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _fadeAnimation;
//   late Animation<double> _slideAnimation;

//   // Controller & animation for "Rise" color cycling
//   late AnimationController _colorController;
//   late Animation<Color?> _colorAnimation;

//   @override
//   void initState() {
//     super.initState();

//     // 1) Fade/Slide Animations
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 3000),
//       vsync: this,
//     );
//     _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: const Interval(0.0, 0.6, curve: Curves.easeIn),
//       ),
//     );
//     _slideAnimation = Tween<double>(begin: 30.0, end: 0.0).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: const Interval(0.2, 0.8, curve: Curves.easeOut),
//       ),
//     );
//     _controller.forward();

//     // 2) Color Animation for "Rise"
//     _colorController = AnimationController(
//       duration: const Duration(seconds: 3),
//       vsync: this,
//     );
//     // Cycle through three color tweens, then repeat
//     _colorAnimation = TweenSequence<Color?>([
//       TweenSequenceItem(
//         tween: ColorTween(begin: Colors.red, end: Colors.green),
//         weight: 1.0,
//       ),
//       TweenSequenceItem(
//         tween: ColorTween(begin: Colors.green, end: Colors.blue),
//         weight: 1.0,
//       ),
//       TweenSequenceItem(
//         tween: ColorTween(begin: Colors.blue, end: Colors.red),
//         weight: 1.0,
//       ),
//     ]).animate(_colorController);

//     _colorController.repeat(); // continuously cycle colors

//     // 3) Navigate after 4 seconds
//     Future.delayed(const Duration(milliseconds: 4000), () {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const LoginScreen()),
//       );
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     _colorController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Use SafeArea or SingleChildScrollView if you get an overflow
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Color(0xFF0F0F0F), Color(0xFF1F1F1F)],
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//             ),
//           ),
//           child: Center(
//             child: AnimatedBuilder(
//               animation: _controller,
//               builder: (context, child) {
//                 return Transform.translate(
//                   offset: Offset(0, _slideAnimation.value),
//                   child: Opacity(
//                     opacity: _fadeAnimation.value,
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min, // keep column tight
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         // Logo with subtle shadow
//                         Container(
//                           padding: const EdgeInsets.all(20),
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.blue.withOpacity(0.1),
//                                 blurRadius: 15,
//                                 spreadRadius: 1,
//                               ),
//                             ],
//                           ),
//                           child: Image.asset(
//                             'lib/assets/images/RiseLogo.png',
//                             width: 150,
//                             height: 150,
//                           ),
//                         ),
//                         const SizedBox(height: 40),

//                         // "The" remains static, "Rise" changes color
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             const Text(
//                               'The ',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 42,
//                                 fontWeight: FontWeight.w800,
//                                 letterSpacing: 6.0,
//                                 fontFamily: 'Helvetica',
//                                 height: 0.9,
//                               ),
//                             ),
//                             AnimatedBuilder(
//                               animation: _colorAnimation,
//                               builder: (context, child) {
//                                 return Text(
//                                   'Rise',
//                                   style: TextStyle(
//                                     fontSize: 42,
//                                     fontWeight: FontWeight.w800,
//                                     letterSpacing: 6.0,
//                                     fontFamily: 'Helvetica',
//                                     height: 0.9,
//                                     color: _colorAnimation.value,
//                                   ),
//                                 );
//                               },
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 30),

//                         // Loader under the title
//                         // If it overflows, wrap the Column or the Loader in a flexible widget
//                         const Loader(),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // ---------------------- SplashScreen ----------------------
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _opacityAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 1200),
//       vsync: this,
//     );

//     _opacityAnimation = Tween<double>(
//       begin: 0.0,
//       end: 1.0,
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

//     _controller.forward();

//     // Navigate to WelcomeScreen after animation completes
//     Future.delayed(const Duration(milliseconds: 1500), () {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const WelcomeScreen()),
//       );
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Center(
//         child: FadeTransition(
//           opacity: _opacityAnimation,
//           child: Image.asset(
//             'lib/assets/images/RiseLogo.png',
//             width: 150,
//             height: 150,
//           ),
//         ),
//       ),
//     );
//   }
// }

// // ---------------------- Loader ----------------------
// class Loader extends StatelessWidget {
//   const Loader({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return StyledWrapper(
//       child: Card(
//         color: const Color(0xFF212121),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//           child: Column(
//             children: const [
//               Text(
//                 'loading',
//                 style: TextStyle(
//                   color: Color(0xFF7C7C7C),
//                   fontFamily: 'Poppins',
//                   fontWeight: FontWeight.w500,
//                   fontSize: 25,
//                 ),
//               ),
//               SizedBox(height: 10),
//               // Container for animated words
//               LoaderWords(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class LoaderWords extends StatelessWidget {
//   const LoaderWords({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 40,
//       child: Stack(
//         children: [
//           Positioned.fill(
//             child: Container(
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [
//                     const Color(0xFF212121).withOpacity(0.1),
//                     Colors.transparent,
//                     Colors.transparent,
//                     const Color(0xFF212121).withOpacity(0.9),
//                   ],
//                   stops: const [0.1, 0.3, 0.7, 0.9],
//                 ),
//               ),
//             ),
//           ),
//           Column(
//             children: const [
//               AnimatedWord(word: 'buttons'),
//               AnimatedWord(word: 'forms'),
//               AnimatedWord(word: 'switches'),
//               AnimatedWord(word: 'cards'),
//               AnimatedWord(word: 'buttons'),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class StyledWrapper extends StatelessWidget {
//   final Widget child;

//   const StyledWrapper({required this.child, Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return child;
//   }
// }

// class AnimatedWord extends StatelessWidget {
//   final String word;

//   const AnimatedWord({required this.word, Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 40,
//       child: Padding(
//         padding: const EdgeInsets.only(left: 6.0),
//         child: Text(word, style: const TextStyle(color: Color(0xFF956AFA))),
//       ),
//     );
//   }
// }
