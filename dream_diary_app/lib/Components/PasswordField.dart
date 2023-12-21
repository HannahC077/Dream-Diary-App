import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool obscureText;
  final VoidCallback onTap;
  final TextEditingController controller;

  const PasswordField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.obscureText,
    required this.onTap,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle:
            GoogleFonts.comfortaa(color: Colors.grey[400], fontSize: 13),
        hintStyle: GoogleFonts.comfortaa(color: Colors.grey[400], fontSize: 13),
        suffixIcon: GestureDetector(
          onTap: onTap,
          child: Icon(
            obscureText ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey[400],
          ),
        ),
        border: InputBorder.none,
      ),
      style: GoogleFonts.comfortaa(fontSize: 13),
      onFieldSubmitted: (submittedValue) {
        // Handle the submission logic here
        controller.clear();
      },
    );
  }
}
