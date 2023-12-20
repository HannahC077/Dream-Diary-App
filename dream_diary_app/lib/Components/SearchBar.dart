import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBarApp extends StatefulWidget {
  const SearchBarApp({Key? key}) : super(key: key);

  @override
  _SearchBarAppState createState() => _SearchBarAppState();
}

class _SearchBarAppState extends State<SearchBarApp> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search, color: Colors.white),
        labelStyle: GoogleFonts.comfortaa(),
        hintStyle: GoogleFonts.comfortaa(),
        hintText: 'Search for an entry',
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      onSubmitted: (value) {
        //search functionality here
        searchController.clear();
      },
      style: GoogleFonts.comfortaa(color: Colors.white, fontSize: 13),
    );
  }
}
