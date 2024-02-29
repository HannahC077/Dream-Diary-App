import 'dart:convert';
import 'package:dream_diary_app/Animation/FadeAnimation.dart';
import 'package:dream_diary_app/Components/CalendarSelect.dart';
import 'package:dream_diary_app/Components/NewEntryFloatingButton.dart';
import 'package:dream_diary_app/Dashboard/Dream%20Entry/entryCard.dart';
import 'package:dream_diary_app/Dashboard/Dream%20Entry/newEntry.dart';
import 'package:dream_diary_app/Models/entry.dart';
import 'package:dream_diary_app/Models/quote.dart';
import 'package:dream_diary_app/Providers/entry_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  static const String routeName = "dashboard";
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  //Animation
  late AnimationController _controller;
  late Animation<Alignment> _topAlignmentAnimation;
  late Animation<Alignment> _bottomAlignmentAnimation;

  //Quote
  int index = 0;
  late Quote quote;

  //Filter
  String filterText = "";
  late FilterType currentFilter;

  //Entries
  List<Entry> entries = [];

  @override
  void initState() {
    super.initState();

    // Animation sequences
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat(reverse: true);
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

    //Quote
    quote = Quote(0, "", "");
    getQuote();

    //Filter
    currentFilter = FilterType.month;
    updateFilterText();

    //Entries
    fetchEntries();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    EntryProvider entryProvider = Provider.of<EntryProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: () async {
          // Implement logic to refresh data here
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 35, left: 35, right: 35),
                child: FadeIn(
                  1,
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, _) {
                      return Column(
                        children: <Widget>[
                          //Quote Box
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
                                          ? const Center(
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
                                                    fontWeight:
                                                        FontWeight.w600),
                                                color: const Color.fromARGB(
                                                    220, 94, 84, 142),
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

                          //note: we can totally not do filter, just delete all the filter stuff

                          //Day - Month - Year Filter
                          SingleChoice(
                            onFilterSelected: (selectedFilter) {
                              setState(() {
                                // Set the filterText based on the selected filter
                                if (selectedFilter == FilterType.day) {
                                  filterText = _getDayOfWeek();
                                } else if (selectedFilter == FilterType.month) {
                                  filterText = _getMonthName();
                                } else if (selectedFilter == FilterType.year) {
                                  filterText = _getCurrentYear().toString();
                                }
                                currentFilter = selectedFilter;
                              });
                            },
                            initialFilter: currentFilter,
                          ),

                          const SizedBox(
                            height: 20,
                          ),

                          // Filter Text
                          Column(
                            children: [
                              Text(
                                filterText,
                                style: GoogleFonts.comfortaa(
                                    color: Colors.grey.shade700,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),

              // Main Section (cards)
              FadeIn(
                1,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      if (entries.isEmpty) //if entries is empty
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 200),
                            child: Text(
                              "No entries to display.",
                              style: GoogleFonts.comfortaa(
                                  fontWeight: FontWeight.w600),

                              //for loading:
                              //CircularProgressIndicator(
                              // color: Color.fromRGBO(115, 104, 169, 1),
                            ),
                          ),
                        ),
                      if (entries.isNotEmpty)
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: entries.length,
                          itemBuilder: (context, index) {
                            Entry entry = entries[index];
                            return EntryCard(
                              date: entry.date,
                              time: entry.time,
                              title: entry.title,
                              description: entry.description,
                            );
                          },
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: NewEntryFloatingButton(onPressed: () {
        Navigator.pushNamed(
          context,
          NewEntry.routeName,
        ).then((_) {
          entryProvider.notifyNewEntry();
        });
      }),
    );
  }

  void newEntryPost() {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(
            opacity: animation,
            child: NewEntry(
              onSaveEntry: () {
                fetchEntries();
              },
            ),
          );
        },
      ),
    );
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

  //Filter Functions
  String _getDayOfWeek() {
    final DateTime now = DateTime.now();
    return DateFormat('EEEE').format(now);
  }

  String _getMonthName() {
    final DateTime now = DateTime.now();
    final String monthName =
        DateFormat('MMMM').format(DateTime(2023, now.month));
    return monthName;
  }

  int _getCurrentYear() {
    final DateTime now = DateTime.now();
    return now.year;
  }

  void updateFilterText() {
    if (currentFilter == FilterType.day) {
      filterText = "";
    } else if (currentFilter == FilterType.month) {
      filterText = _getMonthName();
    } else if (currentFilter == FilterType.year) {
      filterText = _getCurrentYear().toString();
    }
  }

  void fetchEntries() async {
    try {
      final response = await http.get(Uri.parse('http://localhost:3001'));

      if (response.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(response.body);

        entries.clear();

        for (var entryData in jsonData) {
          var entry = Entry.fromJson(entryData);
          entries.add(entry);
        }

        entries.sort((a, b) {
          final DateTime dateA = DateTime.parse(a.date);
          final DateTime dateB = DateTime.parse(b.date);

          int yearComparison = dateB.year.compareTo(dateA.year);
          if (yearComparison != 0) {
            return yearComparison;
          }

          int monthComparison = dateB.month.compareTo(dateA.month);
          if (monthComparison != 0) {
            return monthComparison;
          }

          return dateB.day.compareTo(dateA.day);
        });

        setState(() {});
      } else {
        print('Failed to fetch entries. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error while fetching entries: $error');
    }
  }
}
