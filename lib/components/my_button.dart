import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final VoidCallback onPressed;

  const MyButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 90), // Padding around the text
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: Color(0xFF006699), // Dark background to match the black and white theme
        borderRadius: BorderRadius.circular(40), // Less rounded corners (from 30 to 12)
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          'Log in',
          style: TextStyle(
            color: Colors.white, // White text for contrast
            fontSize: 20, // Slightly larger text
            fontFamily: 'Helvetica',
          ),
          textAlign: TextAlign.center, // Center the text inside the button
        ),
      ),
    );
  }
}
