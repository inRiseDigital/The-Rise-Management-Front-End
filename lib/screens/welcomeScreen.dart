// import 'package:flutter/material.dart';
// import 'login.dart'; // Import your login screen

// // --------------------------------------------------------------------------
// // Custom Loader Widget with blinking dots (from your chatbot code)
// // --------------------------------------------------------------------------
// class Loader extends StatefulWidget {
//   const Loader({Key? key}) : super(key: key);

//   @override
//   _LoaderState createState() => _LoaderState();
// }

// class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   final int numDots = 5;
//   final List<Color> colors = [
//     const Color(0xFF4285F4), // Blue
//     const Color(0xFFEA4335), // Red
//     const Color(0xFFFBBC05), // Yellow
//     const Color(0xFF34A853), // Green
//     const Color(0xFF4285F4), // Blue (repeat for continuity)
//   ];

//   @override
//   void initState() {
//     super.initState();
//     // Create an AnimationController that repeats every 1 second.
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 1000),
//     )..repeat();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: List.generate(numDots, (index) {
//         // Each dot gets an offset so they blink sequentially.
//         double offset = index / numDots;
//         return AnimatedBuilder(
//           animation: _controller,
//           builder: (context, child) {
//             // Calculate progress with the offset, wrapping using modulo.
//             double progress = (_controller.value + offset) % 1.0;
//             // Dot is "on" (fully opaque) for the first half of its cycle, otherwise dim.
//             double opacity = progress < 0.5 ? 1.0 : 0.2;
//             return Container(
//               width: 8,
//               height: 8,
//               margin: const EdgeInsets.symmetric(horizontal: 2),
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: colors[index].withOpacity(opacity),
//               ),
//             );
//           },
//         );
//       }),
//     );
//   }
// }

// // --------------------------------------------------------------------------
// // WelcomeScreen with the custom Loader effect added below the title
// // --------------------------------------------------------------------------
// class WelcomeScreen extends StatefulWidget {
//   const WelcomeScreen({Key? key}) : super(key: key);

//   @override
//   State<WelcomeScreen> createState() => _WelcomeScreenState();
// }

// class _WelcomeScreenState extends State<WelcomeScreen>
//     with TickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _fadeAnimation;
//   late Animation<double> _slideAnimation;

//   // Controller and animation for toggling "RISE" color.
//   late AnimationController _colorController;
//   late Animation<Color?> _riseColorAnimation;

//   @override
//   void initState() {
//     super.initState();

//     // Fade and slide animations.
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

//     // "RISE" color toggle animations.
//     _colorController = AnimationController(
//       duration: const Duration(milliseconds: 3000),
//       vsync: this,
//     )..repeat();
//     _riseColorAnimation = TweenSequence<Color?>([
//       TweenSequenceItem(
//         tween: ColorTween(begin: Colors.red, end: Colors.green),
//         weight: 1,
//       ),
//       TweenSequenceItem(
//         tween: ColorTween(begin: Colors.green, end: Colors.blue),
//         weight: 1,
//       ),
//       TweenSequenceItem(
//         tween: ColorTween(begin: Colors.blue, end: Colors.red),
//         weight: 1,
//       ),
//     ]).animate(_colorController);

//     // Navigate to login screen after the animation completes.
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
//     return Scaffold(
//       // Optional: Set a background color or use a gradient.
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFF0F0F0F), Color(0xFF1F1F1F)],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Center(
//           child: AnimatedBuilder(
//             animation: Listenable.merge([_controller, _colorController]),
//             builder: (context, child) {
//               return Transform.translate(
//                 offset: Offset(0, _slideAnimation.value),
//                 child: Opacity(
//                   opacity: _fadeAnimation.value,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       // Logo with subtle shadow.
//                       Container(
//                         padding: const EdgeInsets.all(20),
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.blue.withOpacity(0.1),
//                               blurRadius: 15,
//                               spreadRadius: 1,
//                             ),
//                           ],
//                         ),
//                         child: Image.asset(
//                           'lib/assets/images/RiseLogo.png',
//                           width: 150,
//                           height: 150,
//                         ),
//                       ),
//                       const SizedBox(height: 40),
//                       // Title with "THE" in white and "RISE" in toggling colors.
//                       RichText(
//                         text: TextSpan(
//                           children: [
//                             const TextSpan(
//                               text: 'THE ',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 42,
//                                 fontWeight: FontWeight.w800,
//                                 letterSpacing: 6.0,
//                                 fontFamily: 'Helvetica',
//                                 height: 0.9,
//                               ),
//                             ),
//                             TextSpan(
//                               text: 'RISE',
//                               style: TextStyle(
//                                 color: _riseColorAnimation.value,
//                                 fontSize: 42,
//                                 fontWeight: FontWeight.w800,
//                                 letterSpacing: 6.0,
//                                 fontFamily: 'Helvetica',
//                                 height: 0.9,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       // Loader effect (blinking dots) with a "Loading..." label.
//                       Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: const [
//                           Loader(),
//                           SizedBox(height: 8),
//                           Text(
//                             "Loading...",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 16,
//                               fontFamily: 'Courier New',
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'login.dart'; // Import your login screen

// --------------------------------------------------------------------------
// Custom Loader Widget with blinking dots
// --------------------------------------------------------------------------
class Loader extends StatefulWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final int numDots = 5;
  final List<Color> colors = [
    const Color(0xFF4285F4), // Blue
    const Color(0xFFEA4335), // Red
    const Color(0xFFFBBC05), // Yellow
    const Color(0xFF34A853), // Green
    const Color(0xFF4285F4), // Blue (repeat for continuity)
  ];

  @override
  void initState() {
    super.initState();
    // Create an AnimationController that repeats every 1 second.
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(numDots, (index) {
        // Each dot gets an offset so they blink sequentially.
        double offset = index / numDots;
        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            // Calculate progress with the offset, wrapping using modulo.
            double progress = (_controller.value + offset) % 1.0;
            // Dot is "on" (fully opaque) for the first half of its cycle, otherwise dim.
            double opacity = progress < 0.5 ? 1.0 : 0.2;
            return Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colors[index].withOpacity(opacity),
              ),
            );
          },
        );
      }),
    );
  }
}

// --------------------------------------------------------------------------
// WelcomeScreen with the custom Loader effect
// --------------------------------------------------------------------------
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _slideAnimation;

  // Controller and animation for toggling "RISE" color.
  late AnimationController _colorController;
  late Animation<Color?> _riseColorAnimation;

  @override
  void initState() {
    super.initState();

    // Fade and slide animations.
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

    // "RISE" color toggle animations.
    _colorController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    )..repeat();
    _riseColorAnimation = TweenSequence<Color?>([
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.red, end: Colors.green),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.green, end: Colors.blue),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.blue, end: Colors.red),
        weight: 1,
      ),
    ]).animate(_colorController);

    // Navigate to login screen after the animation completes.
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
    _colorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Optional: Set a background color or use a gradient.
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
            animation: Listenable.merge([_controller, _colorController]),
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _slideAnimation.value),
                child: Opacity(
                  opacity: _fadeAnimation.value,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Logo without rounded background or shadow.
                      Image.asset(
                        'lib/assets/images/RiseLogo.png',
                        width: 150,
                        height: 150,
                      ),
                      const SizedBox(height: 40),
                      // Title with "THE" in white and "RISE" in toggling colors.
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: 'THE ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 42,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 6.0,
                                fontFamily: 'Helvetica',
                                height: 0.9,
                              ),
                            ),
                            TextSpan(
                              text: 'RISE',
                              style: TextStyle(
                                color: _riseColorAnimation.value,
                                fontSize: 42,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 6.0,
                                fontFamily: 'Helvetica',
                                height: 0.9,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Loader effect (blinking dots) with a "Loading..." label.
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Loader(),
                          SizedBox(height: 8),
                          Text(
                            "Loading...",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Courier New',
                            ),
                          ),
                        ],
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
