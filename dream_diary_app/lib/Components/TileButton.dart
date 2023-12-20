import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TileButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const TileButton(
      {super.key,
      required this.text,
      required this.icon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Row(
          children: [
            Icon(icon, color: Colors.grey.shade500),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              text,
              style: GoogleFonts.comfortaa(
                  color: Colors.grey.shade500, fontWeight: FontWeight.bold),
            ),
          ],
        ));
  }
}
