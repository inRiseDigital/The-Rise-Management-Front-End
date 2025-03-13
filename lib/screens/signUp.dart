// import 'package:flutter/material.dart';

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({Key? key}) : super(key: key);

//   @override
//   _SignUpScreenState createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController =
//       TextEditingController();

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
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const SizedBox(height: 60),
//                 // Logo
//                 Image.asset('lib/assets/images/RiseLogo.png', width: 180),
//                 const SizedBox(height: 50),

//                 Container(
//                   padding: const EdgeInsets.all(24),
//                   decoration: BoxDecoration(
//                     color: const Color(0xFF1A1A1C),
//                     borderRadius: BorderRadius.circular(20),
//                     border: Border.all(color: const Color(0xFF2A2A2C)),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'Sign Up',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 22,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       const SizedBox(height: 20),

//                       // Email TextField
//                       _buildInputField(
//                         controller: _emailController,
//                         hintText: 'Email',
//                         icon: Icons.email_outlined,
//                       ),
//                       const SizedBox(height: 16),

//                       // Password TextField
//                       _buildInputField(
//                         controller: _passwordController,
//                         hintText: 'Password',
//                         icon: Icons.lock_outline,
//                         isPassword: true,
//                       ),
//                       const SizedBox(height: 16),

//                       // Confirm Password TextField
//                       _buildInputField(
//                         controller: _confirmPasswordController,
//                         hintText: 'Confirm Password',
//                         icon: Icons.lock_outline,
//                         isPassword: true,
//                       ),
//                       const SizedBox(height: 8),

//                       // Forgot Password
//                       Align(
//                         alignment: Alignment.centerRight,
//                         child: TextButton(
//                           onPressed: () {
//                             // Implement forgot password logic
//                           },
//                           child: const Text(
//                             'Forgot Password?',
//                             style: TextStyle(
//                               color: Colors.white70,
//                               fontSize: 14,
//                             ),
//                           ),
//                         ),
//                       ),

//                       const SizedBox(height: 30),
//                       Container(
//                         width: double.infinity,
//                         height: 50,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(30),
//                           gradient: const LinearGradient(
//                             colors: [Color(0xFF2E2E30), Color(0xFF1A1A1C)],
//                           ),
//                           border: Border.all(color: Colors.white24),
//                         ),
//                         child: TextButton(
//                           onPressed: () {
//                             // Implement sign up logic
//                           },
//                           child: const Text(
//                             'Sign Up',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 16,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 const SizedBox(height: 40),
//                 const Row(
//                   children: [
//                     Expanded(child: Divider(color: Colors.white24)),
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 16),
//                       child: Text(
//                         "Or continue with",
//                         style: TextStyle(color: Colors.white54, fontSize: 14),
//                       ),
//                     ),
//                     Expanded(child: Divider(color: Colors.white24)),
//                   ],
//                 ),
//                 const SizedBox(height: 30),

//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     _buildSocialButton(
//                       onPressed: () {
//                         // Implement Google login
//                       },
//                       child: const Text(
//                         'G',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 20),
//                     _buildSocialButton(
//                       onPressed: () {
//                         // Implement Facebook login
//                       },
//                       child: const Icon(
//                         Icons.facebook,
//                         color: Colors.white,
//                         size: 24,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildInputField({
//     required TextEditingController controller,
//     required String hintText,
//     required IconData icon,
//     bool isPassword = false,
//   }) {
//     return Container(
//       decoration: BoxDecoration(
//         color: const Color(0xFF222224),
//         borderRadius: BorderRadius.circular(30),
//         border: Border.all(color: const Color(0xFF2A2A2C)),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20.0),
//         child: Row(
//           children: [
//             Icon(icon, color: Colors.white70),
//             const SizedBox(width: 20),
//             Expanded(
//               child: TextField(
//                 controller: controller,
//                 obscureText: isPassword,
//                 style: const TextStyle(color: Colors.white),
//                 decoration: InputDecoration(
//                   hintText: hintText,
//                   hintStyle: const TextStyle(
//                     color: Color(0xFFABABAB),
//                     fontSize: 16,
//                   ),
//                   border: InputBorder.none,
//                   contentPadding: const EdgeInsets.symmetric(vertical: 16),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildSocialButton({
//     required Widget child,
//     required VoidCallback onPressed,
//   }) {
//     return Container(
//       width: 50,
//       height: 50,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         color: const Color(0xFF1A1A1C),
//         border: Border.all(color: Colors.white24),
//       ),
//       child: Material(
//         color: Colors.transparent,
//         child: InkWell(
//           borderRadius: BorderRadius.circular(25),
//           onTap: onPressed,
//           child: Center(child: child),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     _confirmPasswordController.dispose();
//     super.dispose();
//   }
// }

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _userRoleController = TextEditingController(
    text: 'user',
  );

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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                // Logo
                Image.asset('lib/assets/images/RiseLogo.png', width: 180),
                const SizedBox(height: 50),

                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A1A1C),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xFF2A2A2C)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Username TextField
                      _buildInputField(
                        controller: _usernameController,
                        hintText: 'Username',
                        icon: Icons.person_outline,
                      ),
                      const SizedBox(height: 16),

                      // Email TextField
                      _buildInputField(
                        controller: _emailController,
                        hintText: 'Email',
                        icon: Icons.email_outlined,
                      ),
                      const SizedBox(height: 16),

                      // Contact TextField
                      _buildInputField(
                        controller: _contactController,
                        hintText: 'Contact',
                        icon: Icons.phone_outlined,
                      ),
                      const SizedBox(height: 16),

                      // Password TextField
                      _buildInputField(
                        controller: _passwordController,
                        hintText: 'Password',
                        icon: Icons.lock_outline,
                        isPassword: true,
                      ),
                      const SizedBox(height: 16),

                      // Confirm Password TextField
                      _buildInputField(
                        controller: _confirmPasswordController,
                        hintText: 'Confirm Password',
                        icon: Icons.lock_outline,
                        isPassword: true,
                      ),
                      const SizedBox(height: 8),

                      // Forgot Password
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            // Implement forgot password logic
                          },
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),
                      Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: const LinearGradient(
                            colors: [Color(0xFF2E2E30), Color(0xFF1A1A1C)],
                          ),
                          border: Border.all(color: Colors.white24),
                        ),
                        child: TextButton(
                          onPressed: () async {
                            // Implement sign up logic
                            final signUpData = {
                              "username": _usernameController.text,
                              "email": _emailController.text,
                              "contact": _contactController.text,
                              "password": _passwordController.text,
                              "user_role": _userRoleController.text,
                            };

                            final response = await http.post(
                              Uri.parse(
                                'https://game-parrot-trivially.ngrok-free.app/signin/create_user/',
                              ),
                              headers: {'Content-Type': 'application/json'},
                              body: jsonEncode(signUpData),
                            );

                            if (response.statusCode == 200) {
                              // Handle successful sign up
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Sign up successful'),
                                ),
                              );
                            } else {
                              // Handle sign up error
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Sign up failed')),
                              );
                            }
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),
                const Row(
                  children: [
                    Expanded(child: Divider(color: Colors.white24)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Or continue with",
                        style: TextStyle(color: Colors.white54, fontSize: 14),
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.white24)),
                  ],
                ),
                const SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildSocialButton(
                      onPressed: () {
                        // Implement Google login
                      },
                      child: const Text(
                        'G',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    _buildSocialButton(
                      onPressed: () {
                        // Implement Facebook login
                      },
                      child: const Icon(
                        Icons.facebook,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool isPassword = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF222224),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: const Color(0xFF2A2A2C)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.white70),
            const SizedBox(width: 20),
            Expanded(
              child: TextField(
                controller: controller,
                obscureText: isPassword,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: const TextStyle(
                    color: Color(0xFFABABAB),
                    fontSize: 16,
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required Widget child,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFF1A1A1C),
        border: Border.all(color: Colors.white24),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: onPressed,
          child: Center(child: child),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _contactController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _userRoleController.dispose();
    super.dispose();
  }
}
