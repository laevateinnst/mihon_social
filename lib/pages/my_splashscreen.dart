import 'dart:async';
import 'package:flutter/material.dart';
import 'login_page.dart'; // Make sure this import points to the correct location of your LoginPage

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Set a timer to navigate to the login page after 2 seconds with a bottom-to-top slide transition
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 600), // Slower transition duration (800 ms)
          pageBuilder: (context, animation, secondaryAnimation) => LogInPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0); // Start from the bottom of the screen
            const end = Offset.zero; // End at the center
            const curve = Curves.easeInOut;

            final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            final offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF202123), // ChatGPT's background color
      body: Center(
        child: Image.asset(
          'assets/icons/logo.png',
          width: 100,
          height: 100,
          color: Colors.white, // Tint the logo to white
        ),
      ),
    );
  }
}
