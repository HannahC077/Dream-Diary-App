import 'package:dream_diary_app/Components/SearchBar.dart';
import 'package:flutter/material.dart';
import 'package:dream_diary_app/Animation/FadeAnimation.dart';

class SearchPage extends StatefulWidget {
  static const String routeName = "search";
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late String searchQuery = ''; //store query

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FadeIn(
              1,
              Container(
                height: 200,
                padding: EdgeInsets.only(left: 20),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/search_header.png'),
                      fit: BoxFit.fill),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 55,
                      width: 380,
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: FadeIn(
                          1,
                          SearchBarApp(), //Search Bar field
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            FadeIn(
              1,
              Positioned(
                child: Container(
                  height: 420,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/search_bg.png'),
                          fit: BoxFit.fill)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
