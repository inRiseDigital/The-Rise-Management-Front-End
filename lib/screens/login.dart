// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import './mainChat.dart';
// import 'changePassword.dart';
// import 'welcomeScreen.dart' as welcome;
// import '../dashboardOverview/dashboardOverview.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool _isLoading = false;

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   Map<String, dynamic> parseJwt(String token) {
//     final parts = token.split('.');
//     if (parts.length != 3) {
//       throw Exception("Invalid token");
//     }
//     final payload = parts[1];
//     String normalized = base64Url.normalize(payload);
//     final payloadBytes = base64Url.decode(normalized);
//     final payloadMap = json.decode(utf8.decode(payloadBytes));
//     if (payloadMap is! Map<String, dynamic>) {
//       throw Exception("Invalid payload");
//     }
//     return payloadMap;
//   }

//   Future<void> _handleLogin() async {
//     setState(() {
//       _isLoading = true;
//     });

//     final String apiUrl =
//         "https://game-parrot-trivially.ngrok-free.app/auth/token";
//     final String username = _emailController.text.trim();
//     final String password = _passwordController.text.trim();

//     if (username.isEmpty || password.isEmpty) {
//       _showErrorDialog("Please enter both username and password.");
//       setState(() {
//         _isLoading = false;
//       });
//       return;
//     }

//     try {
//       final response = await http.post(
//         Uri.parse(apiUrl),
//         headers: {"Content-Type": "application/x-www-form-urlencoded"},
//         body: {
//           "grant_type": "password",
//           "username": username,
//           "password": password,
//           "scope": "",
//           "client_id": "",
//           "client_secret": "",
//         },
//       );

//       setState(() {
//         _isLoading = false;
//       });

//       if (response.statusCode == 200) {
//         final responseData = jsonDecode(response.body);
//         if (responseData["access_token"] != null) {
//           String accessToken = responseData["access_token"];
//           try {
//             final payload = parseJwt(accessToken);
//             if (payload["role"] == "admin") {
//               Navigator.of(context).pushReplacement(
//                 MaterialPageRoute(
//                   builder: (context) => ChatScreen(accessToken: accessToken),
//                 ),
//               );
//             } else {
//               Navigator.of(context).pushReplacement(
//                 MaterialPageRoute(
//                   builder:
//                       (context) => DashboardOverview(
//                         username: username,
//                         accessToken: accessToken,
//                       ),
//                 ),
//               );
//             }
//           } catch (e) {
//             _showErrorDialog("Token parsing error: $e");
//           }
//         } else {
//           _showErrorDialog("Login failed. Access token not received.");
//         }
//       } else if (response.statusCode == 422) {
//         String errorMsg = "Validation error:";
//         try {
//           final data = jsonDecode(response.body);
//           if (data["detail"] != null) {
//             errorMsg += " ${data["detail"].toString()}";
//           }
//         } catch (e) {
//           // Fallback error message
//         }
//         _showErrorDialog(errorMsg);
//       } else {
//         String errorMsg = "Invalid credentials or server error.";
//         try {
//           final responseData = jsonDecode(response.body);
//           if (responseData["message"] != null) {
//             errorMsg = responseData["message"];
//           }
//         } catch (e) {
//           // Use default error message if parsing fails
//         }
//         _showErrorDialog(errorMsg);
//       }
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//       });
//       _showErrorDialog("Network error: Unable to reach the server.");
//     }
//   }

//   void _showErrorDialog(String message) {
//     showDialog(
//       context: context,
//       builder:
//           (context) => AlertDialog(
//             title: const Text(
//               "Login Failed",
//               style: TextStyle(color: Colors.red),
//             ),
//             content: Text(message),
//             actions: [
//               TextButton(
//                 onPressed: () => Navigator.pop(context),
//                 child: const Text("OK"),
//               ),
//             ],
//           ),
//     );
//   }

//   void _showComingSoonDialog(String feature) {
//     showDialog(
//       context: context,
//       builder:
//           (context) => AlertDialog(
//             title: Text("$feature Coming Soon"),
//             content: Text("$feature integration will be available soon."),
//             actions: [
//               TextButton(
//                 onPressed: () => Navigator.pop(context),
//                 child: const Text("OK"),
//               ),
//             ],
//           ),
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
//                 const SizedBox(height: 60),
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
//                       _buildInputField(
//                         controller: _emailController,
//                         hintText: 'Username',
//                         icon: Icons.email_outlined,
//                       ),
//                       const SizedBox(height: 16),
//                       _buildInputField(
//                         controller: _passwordController,
//                         hintText: 'Password',
//                         icon: Icons.lock_outline,
//                         isPassword: true,
//                       ),

//                       Align(
//                         alignment: Alignment.centerRight,
//                         child: TextButton(
//                           onPressed: () {
//                             Navigator.of(context).push(
//                               MaterialPageRoute(
//                                 builder:
//                                     (context) => const ChangePasswordScreen(),
//                               ),
//                             );
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
//                           onPressed: _isLoading ? null : _handleLogin,
//                           child:
//                               _isLoading
//                                   ? Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       welcome.Loader(),
//                                       const SizedBox(width: 12),
//                                       const Text(
//                                         "Logging in...",
//                                         style: TextStyle(
//                                           color: Colors.white70,
//                                           fontSize: 14,
//                                         ),
//                                       ),
//                                     ],
//                                   )
//                                   : const Text(
//                                     'Sign In',
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                         ),
//                       ),

//                       const SizedBox(height: 16),
//                       Container(
//                         width: double.infinity,
//                         height: 50,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(30),
//                           color: Colors.transparent,
//                           border: Border.all(color: Colors.white24),
//                         ),
//                         child: TextButton(
//                           onPressed: () => _showComingSoonDialog("Sign Up"),
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
//                       onPressed: () => _showComingSoonDialog("Google login"),
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
//                       onPressed: () => _showComingSoonDialog("Facebook login"),
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
// }

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './mainChat.dart';
import 'changePassword.dart';
import 'welcomeScreen.dart' as welcome;
import '../dashboardOverview/dashboardOverview.dart';
import 'signUp.dart'; // Import the SignUpScreen

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Map<String, dynamic> parseJwt(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception("Invalid token");
    }
    final payload = parts[1];
    String normalized = base64Url.normalize(payload);
    final payloadBytes = base64Url.decode(normalized);
    final payloadMap = json.decode(utf8.decode(payloadBytes));
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception("Invalid payload");
    }
    return payloadMap;
  }

  Future<void> _handleLogin() async {
    setState(() {
      _isLoading = true;
    });

    final String apiUrl =
        "https://game-parrot-trivially.ngrok-free.app/auth/token";
    final String username = _emailController.text.trim();
    final String password = _passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      _showErrorDialog("Please enter both username and password.");
      setState(() {
        _isLoading = false;
      });
      return;
    }

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: {
          "grant_type": "password",
          "username": username,
          "password": password,
          "scope": "",
          "client_id": "",
          "client_secret": "",
        },
      );

      setState(() {
        _isLoading = false;
      });

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        if (responseData["access_token"] != null) {
          String accessToken = responseData["access_token"];
          try {
            final payload = parseJwt(accessToken);
            if (payload["role"] == "admin") {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => ChatScreen(accessToken: accessToken),
                ),
              );
            } else {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder:
                      (context) => DashboardOverview(
                        username: username,
                        accessToken: accessToken,
                      ),
                ),
              );
            }
          } catch (e) {
            _showErrorDialog("Token parsing error: $e");
          }
        } else {
          _showErrorDialog("Login failed. Access token not received.");
        }
      } else if (response.statusCode == 422) {
        String errorMsg = "Validation error:";
        try {
          final data = jsonDecode(response.body);
          if (data["detail"] != null) {
            errorMsg += " ${data["detail"].toString()}";
          }
        } catch (e) {
          // Fallback error message
        }
        _showErrorDialog(errorMsg);
      } else {
        String errorMsg = "Invalid credentials or server error.";
        try {
          final responseData = jsonDecode(response.body);
          if (responseData["message"] != null) {
            errorMsg = responseData["message"];
          }
        } catch (e) {
          // Use default error message if parsing fails
        }
        _showErrorDialog(errorMsg);
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      _showErrorDialog("Network error: Unable to reach the server.");
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text(
              "Login Failed",
              style: TextStyle(color: Colors.red),
            ),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("OK"),
              ),
            ],
          ),
    );
  }

  void _showComingSoonDialog(String feature) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text("$feature Coming Soon"),
            content: Text("$feature integration will be available soon."),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("OK"),
              ),
            ],
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
                const SizedBox(height: 60),
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
                      _buildInputField(
                        controller: _emailController,
                        hintText: 'Username',
                        icon: Icons.email_outlined,
                      ),
                      const SizedBox(height: 16),
                      _buildInputField(
                        controller: _passwordController,
                        hintText: 'Password',
                        icon: Icons.lock_outline,
                        isPassword: true,
                      ),

                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder:
                                    (context) => const ChangePasswordScreen(),
                              ),
                            );
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
                          onPressed: _isLoading ? null : _handleLogin,
                          child:
                              _isLoading
                                  ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      welcome.Loader(),
                                      const SizedBox(width: 12),
                                      const Text(
                                        "Logging in...",
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  )
                                  : const Text(
                                    'Sign In',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                        ),
                      ),

                      const SizedBox(height: 16),
                      Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.transparent,
                          border: Border.all(color: Colors.white24),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const SignUpScreen(),
                              ),
                            );
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
                      onPressed: () => _showComingSoonDialog("Google login"),
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
                      onPressed: () => _showComingSoonDialog("Facebook login"),
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
}
