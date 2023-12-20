import 'package:flutter/material.dart';
import 'package:dream_diary_app/routes.dart';
import 'package:dream_diary_app/Animation/FadeAnimation.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatefulWidget {
  static const String routeName = "dashboard";
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard",
            style: GoogleFonts.raleway(
                color: Colors.grey.shade800, fontWeight: FontWeight.w600)),
        backgroundColor: Colors.amber.shade200,
        leading: Center(
          child: Image.network(
            'https://imgur.com/FiKUrjS.png',
            height: 40,
            width: 40,
          ),
        ),
      ),
    );
  }
}
