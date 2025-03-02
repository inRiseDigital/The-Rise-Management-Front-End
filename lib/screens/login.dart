import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'mainChat.dart';
import 'changePassword.dart';
import 'welcomeScreen.dart' as welcome; // Use a prefix to avoid ambiguity

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login',
      theme: ThemeData.dark(),
      home: const LoginScreen(),
    );
  }
}

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

  Future<void> _handleLogin() async {
    setState(() {
      _isLoading = true;
    });

    final String apiUrl =
        "https://99aa-122-255-33-126.ngrok-free.app/auth/token";
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
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => ChatScreen(accessToken: accessToken),
            ),
          );
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
            title: const Text("Login Failed"),
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
                              hintText: 'Username',
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
                    onPressed: _isLoading ? null : _handleLogin,
                    child:
                        _isLoading
                            ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                welcome.Loader(), // Using the prefixed Loader
                                const SizedBox(height: 4),
                                const Text(
                                  "Logging in...",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: 'Courier New',
                                  ),
                                ),
                              ],
                            )
                            : const Text(
                              'Log in',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
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
