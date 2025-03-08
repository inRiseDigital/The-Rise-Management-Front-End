import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/theme_notifier.dart';
import 'widgets/splashScreen.dart'; // Import the SplashScreen

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Rise',
          theme: themeNotifier.currentTheme,
          home: const SplashScreen(), // Start with the SplashScreen
        );
      },
    );
  }
}
