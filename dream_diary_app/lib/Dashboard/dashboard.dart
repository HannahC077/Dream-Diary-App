import 'dart:convert';
import 'package:dream_diary_app/Animation/FadeAnimation.dart';
import 'package:dream_diary_app/Components/CalendarSelect.dart';
import 'package:dream_diary_app/Components/newEntryFloatingButton.dart';
import 'package:dream_diary_app/Models/quote.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Dashboard extends StatefulWidget {
  static const String routeName = "dashboard";
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _topAlignmentAnimation;
  late Animation<Alignment> _bottomAlignmentAnimation;

  int index = 0;
  late Quote quote;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat(reverse: true);

    // Animation sequences
    _topAlignmentAnimation = TweenSequence<Alignment>(
      [
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
          ),
          weight: 1,
        ),
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
          ),
          weight: 1,
        ),
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
            begin: Alignment.bottomRight,
            end: Alignment.bottomLeft,
          ),
          weight: 1,
        ),
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
            begin: Alignment.bottomLeft,
            end: Alignment.topLeft,
          ),
          weight: 1,
        ),
      ],
    ).animate(_controller);

    _bottomAlignmentAnimation = TweenSequence<Alignment>(
      [
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
            begin: Alignment.bottomRight,
            end: Alignment.bottomLeft,
          ),
          weight: 1,
        ),
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
            begin: Alignment.bottomLeft,
            end: Alignment.topLeft,
          ),
          weight: 1,
        ),
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
          ),
          weight: 1,
        ),
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
          ),
          weight: 1,
        ),
      ],
    ).animate(_controller);

    quote = Quote(0, "", "");
    getQuote(); //retrieve quote
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(35),
              child: FadeIn(
                1,
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, _) {
                    return Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromRGBO(94, 84, 142, 0.2),
                                    blurRadius: 20.0,
                                    offset: Offset(0, 3)),
                              ]),
                          child: Column(
                            children: <Widget>[
                              Container(
                                //Quote Box
                                height: 130,
                                width: 350,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  gradient: LinearGradient(
                                    colors: const [
                                      Color.fromARGB(255, 240, 229, 255),
                                      Color.fromRGBO(210, 194, 232, 1),
                                    ],
                                    begin: _topAlignmentAnimation.value,
                                    end: _bottomAlignmentAnimation.value,
                                  ),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(25),
                                    child: quote.text.isEmpty
                                        ? Center(
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                              strokeWidth: 3.0,
                                            ),
                                          )
                                        : Text(quote.text,
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.comfortaa(
                                              fontSize: 12,
                                              textStyle: const TextStyle(
                                                  wordSpacing: 2.0,
                                                  fontWeight: FontWeight.w600),
                                              color: const Color.fromRGBO(
                                                  94, 84, 142, 0.7),
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 5),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SingleChoice(), //filter
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: newEntryFloatingButton(
        //New Entry Button
        onPressed: nullFn,
      ),
    );
  }

  void nullFn() {
    //asdsd
  }
  Future<void> getQuote() async {
    try {
      Response response =
          await http.get(Uri.parse("https://dummyjson.com/quotes/random"));

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = jsonDecode(response.body);

        Quote newQuote =
            Quote(jsonData['id'], jsonData['quote'], jsonData['author']);

        setState(() {
          quote = newQuote;
        });
      } else {
        print("Failed to get quote. Status code: ${response.statusCode}");
      }
    } catch (error) {
      print("Error while fetching quote: $error");
    }
  }
}
