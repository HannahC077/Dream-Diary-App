import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LongTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextInputType textInputType;
  final TextEditingController controller;

  const LongTextField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.textInputType,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 20),
      width: double.infinity,
      child: TextFormField(
        controller: controller,
        keyboardType: textInputType,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          labelStyle:
              GoogleFonts.comfortaa(color: Colors.grey[400], fontSize: 13),
          hintStyle:
              GoogleFonts.comfortaa(color: Colors.grey[400], fontSize: 13),
          border: InputBorder.none,
        ),
        style: GoogleFonts.comfortaa(fontSize: 13),
        onFieldSubmitted: (submittedValue) {
          // Handle the submission logic here
          controller.clear();
        },
        maxLines: 4,
        textAlign: TextAlign.justify,
      ),
    );
  }
}
