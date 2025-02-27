// import 'package:flutter/material.dart';
// import 'mainChat.dart'; // Import the ChatScreen file

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   // Method to handle login and navigation
//   void _handleLogin() {
//     // Here you would typically add authentication logic
//     // For this example, we'll just navigate to the chat screen directly
//     Navigator.of(context).pushReplacement(
//       MaterialPageRoute(builder: (context) => const ChatScreen()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF131314),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 24.0,
//               vertical: 16.0,
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const SizedBox(height: 120),
//                 Image.asset('lib/assets/images/RiseLogo.png', width: 280),
//                 const SizedBox(height: 20),
//                 Image.asset('lib/assets/images/ayubowan.png', width: 280),
//                 const SizedBox(height: 60),
//                 Container(
//                   decoration: BoxDecoration(
//                     color: const Color(0xFF222224),
//                     borderRadius: BorderRadius.circular(30),
//                     border: Border.all(color: const Color(0xFF222224)),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                     child: Row(
//                       children: [
//                         const Icon(Icons.email_outlined, color: Colors.white),
//                         const SizedBox(width: 20),
//                         Expanded(
//                           child: TextField(
//                             controller: _emailController,
//                             decoration: const InputDecoration(
//                               hintText: 'email',
//                               hintStyle: TextStyle(
//                                 color: Color(0xFFABABAB),
//                                 fontSize: 20,
//                               ),
//                               border: InputBorder.none,
//                               contentPadding: EdgeInsets.symmetric(
//                                 vertical: 20,
//                               ),
//                             ),
//                             style: const TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 Container(
//                   decoration: BoxDecoration(
//                     color: const Color(0xFF222224),
//                     borderRadius: BorderRadius.circular(30),
//                     border: Border.all(color: const Color(0xFF222224)),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                     child: Row(
//                       children: [
//                         const Icon(Icons.lock_outline, color: Colors.white),
//                         const SizedBox(width: 20),
//                         Expanded(
//                           child: TextField(
//                             controller: _passwordController,
//                             obscureText: true,
//                             decoration: const InputDecoration(
//                               hintText: 'password',
//                               hintStyle: TextStyle(
//                                 color: Color(0xFFABABAB),
//                                 fontSize: 20,
//                               ),
//                               border: InputBorder.none,
//                               contentPadding: EdgeInsets.symmetric(
//                                 vertical: 20,
//                               ),
//                             ),
//                             style: const TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 Align(
//                   alignment: Alignment.center,
//                   child: TextButton(
//                     onPressed: () {
//                       // Forgot password logic
//                     },
//                     child: const Text(
//                       'Forgot Password?',
//                       style: TextStyle(color: Colors.white, fontSize: 16),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//                 Container(
//                   width: double.infinity,
//                   height: 60,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(30),
//                     color: Colors.transparent,
//                     border: Border.all(color: Colors.white, width: 1),
//                   ),
//                   child: TextButton(
//                     onPressed: _handleLogin, // Use the new login method
//                     child: const Text(
//                       'Log in',
//                       style: TextStyle(color: Colors.white, fontSize: 20),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'mainChat.dart'; // Import the ChatScreen file

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   // Method to handle login and navigation
//   void _handleLogin() {
//     // Here you would typically add authentication logic
//     // For this example, we'll just navigate to the chat screen directly
//     Navigator.of(context).pushReplacement(
//       MaterialPageRoute(builder: (context) => const ChatScreen()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF131314),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 24.0,
//               vertical: 16.0,
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const SizedBox(height: 80),
//                 Image.asset('lib/assets/images/RiseLogo.png', width: 200),
//                 const SizedBox(height: 20),
//                 Image.asset('lib/assets/images/ayubowan.png', width: 200),
//                 const SizedBox(height: 40),
//                 Container(
//                   decoration: BoxDecoration(
//                     color: const Color(0xFF222224),
//                     borderRadius: BorderRadius.circular(30),
//                     border: Border.all(color: const Color(0xFF222224)),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                     child: Row(
//                       children: [
//                         const Icon(Icons.email_outlined, color: Colors.white),
//                         const SizedBox(width: 20),
//                         Expanded(
//                           child: TextField(
//                             controller: _emailController,
//                             decoration: const InputDecoration(
//                               hintText: 'Email',
//                               hintStyle: TextStyle(
//                                 color: Color(0xFFABABAB),
//                                 fontSize: 18,
//                               ),
//                               border: InputBorder.none,
//                               contentPadding: EdgeInsets.symmetric(
//                                 vertical: 16,
//                               ),
//                             ),
//                             style: const TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 Container(
//                   decoration: BoxDecoration(
//                     color: const Color(0xFF222224),
//                     borderRadius: BorderRadius.circular(30),
//                     border: Border.all(color: const Color(0xFF222224)),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                     child: Row(
//                       children: [
//                         const Icon(Icons.lock_outline, color: Colors.white),
//                         const SizedBox(width: 20),
//                         Expanded(
//                           child: TextField(
//                             controller: _passwordController,
//                             obscureText: true,
//                             decoration: const InputDecoration(
//                               hintText: 'Password',
//                               hintStyle: TextStyle(
//                                 color: Color(0xFFABABAB),
//                                 fontSize: 18,
//                               ),
//                               border: InputBorder.none,
//                               contentPadding: EdgeInsets.symmetric(
//                                 vertical: 16,
//                               ),
//                             ),
//                             style: const TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 Align(
//                   alignment: Alignment.center,
//                   child: TextButton(
//                     onPressed: () {
//                       // Forgot password logic
//                     },
//                     child: const Text(
//                       'Forgot Password?',
//                       style: TextStyle(color: Colors.white, fontSize: 16),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//                 Container(
//                   width: double.infinity,
//                   height: 50,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(30),
//                     color: Colors.transparent,
//                     border: Border.all(color: Colors.white, width: 1),
//                   ),
//                   child: TextButton(
//                     onPressed: _handleLogin, // Use the new login method
//                     child: const Text(
//                       'Log in',
//                       style: TextStyle(color: Colors.white, fontSize: 18),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'changePassword.dart'; // Import the ChangePasswordScreen file
import 'mainChat.dart'; // Import the ChatScreen file

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Method to handle login and navigation
  void _handleLogin() {
    // Here you would typically add authentication logic
    // For this example, we'll just navigate to the chat screen directly
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const ChatScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF131314),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 16.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 80),
                Image.asset('lib/assets/images/RiseLogo.png', width: 200),
                const SizedBox(height: 20),
                Image.asset('lib/assets/images/ayubowan.png', width: 200),
                const SizedBox(height: 40),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF222224),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: const Color(0xFF222224)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        const Icon(Icons.email_outlined, color: Colors.white),
                        const SizedBox(width: 20),
                        Expanded(
                          child: TextField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              hintText: 'Email',
                              hintStyle: TextStyle(
                                color: Color(0xFFABABAB),
                                fontSize: 18,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 16,
                              ),
                            ),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF222224),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: const Color(0xFF222224)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        const Icon(Icons.lock_outline, color: Colors.white),
                        const SizedBox(width: 20),
                        Expanded(
                          child: TextField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                color: Color(0xFFABABAB),
                                fontSize: 18,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 16,
                              ),
                            ),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      // Navigate to ChangePasswordScreen
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ChangePasswordScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.transparent,
                    border: Border.all(color: Colors.white, width: 1),
                  ),
                  child: TextButton(
                    onPressed: _handleLogin, // Use the new login method
                    child: const Text(
                      'Log in',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
