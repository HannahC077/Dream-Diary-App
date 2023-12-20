import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextInputType textInputType;
  final TextEditingController controller;

  const CustomTextFormField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.textInputType,
    required this.controller
  })
  : assert(controller != null);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        keyboardType: textInputType,
        decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            labelStyle: GoogleFonts.comfortaa(color: Colors.grey[400]),
            hintStyle: GoogleFonts.comfortaa(color: Colors.grey[400]),
            border: InputBorder.none),
        style: GoogleFonts.comfortaa(fontSize: 13));
  }
}
