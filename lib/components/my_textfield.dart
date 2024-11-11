import 'package:flutter/material.dart';

class MyTextfield extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final TextInputAction inputAction;

  const MyTextfield({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.inputAction,
  }) : super(key: key);

  @override
  _MyTextfieldState createState() => _MyTextfieldState();
}

class _MyTextfieldState extends State<MyTextfield> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    // Initialize the obscureText to match the initial widget state
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Theme(
          data: Theme.of(context).copyWith(
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: Color(0xFF006699), // White cursor color
              selectionColor: Color(0xFF006699), // White selection bubble color with slight transparency
              selectionHandleColor: Color(0xFF006699) // White selection handle color
            ),
          ),
          child: TextField(
            controller: widget.controller,
            obscureText: _obscureText,
            textInputAction: widget.inputAction,
            style: const TextStyle(
              fontFamily: 'Helvetica', // Set the font family to Helvetica
              color: Colors.white,
              fontSize: 18,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.black.withOpacity(0.7), // Darker, sleek fill color (same as button)
              hintText: widget.hintText,
              hintStyle: const TextStyle(
                fontFamily: 'Helvetica', // Apply Helvetica to hint text as well
                color: Colors.white54, // Lighter hint text
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12), // Match the button's border radius
                borderSide: BorderSide.none, // No border by default
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(0xFF006699), // Blue accent on focus (same as button)
                  width: 2, // Slightly thicker blue border for focus
                ),
              ),
              suffixIcon: widget.obscureText
                  ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.white54,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
                  : null, // Show "visibility" icon only for password fields
            ),
          ),
        ),
      ],
    );
  }
}
