import 'package:flutter/material.dart';
import 'package:first_app/components/my_button.dart';
import 'package:first_app/components/my_textfield.dart';
import 'profile_page.dart'; // Import ProfilePage
import '../data/sample_data.dart'; // Import sample data
import '../data/user_model.dart'; // Import User model

class LogInPage extends StatelessWidget {
  LogInPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void _login(BuildContext context) {
    final username = usernameController.text;
    final password = passwordController.text;

    // Filter users by username and password
    List<User> validUsers = sampleUsers.where(
          (user) => user.username == username && user.password == password,
    ).toList();

    if (validUsers.isNotEmpty) {
      // If a valid user is found, pass user data to ProfilePage
      User validUser = validUsers.first;

      // Use PageRouteBuilder for a custom slide-up transition
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              ProfilePage(user: validUser),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Apply a slide-up transition (from bottom to top)
            const begin = Offset(0.0, 1.0); // Start off the screen
            const end = Offset.zero; // End at the screen center
            const curve = Curves
                .easeInOutCubic; // Smoother and faster transition curve

            var tween = Tween<Offset>(begin: begin, end: end).animate(
              CurvedAnimation(
                parent: animation,
                curve: curve,
              ),
            );

            // Faster duration for the animation (200ms)
            return SlideTransition(position: tween, child: child);
          },
          transitionDuration: const Duration(
              milliseconds: 500), // Adjust duration for faster transition
        ),
      );
    } else {
      // Show error message if credentials are invalid
      showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(
              backgroundColor: const Color(0xFF303030),
              // Dark background for dialog
              title: const Text(
                'Invalid Credentials',
                style: TextStyle(
                  color: Colors.white, // White title text
                ),
              ),
              content: const Text(
                'Please check your username and password.',
                style: TextStyle(
                  color: Colors.white, // White content text
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: const Text(
                    'OK',
                    style: TextStyle(
                      color: Colors.white, // White button text
                    ),
                  ),
                ),
              ],
            ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF181818), // Dark, modern background
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // Align items to the top
            crossAxisAlignment: CrossAxisAlignment.center,
            // Keep the horizontal centering
            children: [
              const SizedBox(height: 150),
              // Add spacing from the top to raise the content

              // Icon without gradient
              Image.asset(
                'assets/icons/logo.png',
                width: 100,
                height: 100,
                color: Colors.white, // Tint the logo to white
              ),

              const SizedBox(height: 18),
              Text(
                'Mihon Social',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  // Slightly opaque for a refined look
                  fontSize: 24,
                  fontFamily: 'Helvetica',
                ),
              ),
              const SizedBox(height: 70),

              // Username field with modern styling
              MyTextfield(
                controller: usernameController,
                hintText: 'Username',
                obscureText: false,
                inputAction: TextInputAction
                    .next, // Focus moves to password field
              ),
              const SizedBox(height: 16),

              // Password field with modern styling
              MyTextfield(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
                inputAction: TextInputAction
                    .done, // Close the keyboard after input
              ),
              const SizedBox(height: 70),

              // Custom login button
              MyButton(onPressed: () => _login(context)),
            ],
          ),
        ),
      ),
    );
  }
}