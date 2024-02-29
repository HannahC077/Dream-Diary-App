import 'package:dream_diary_app/Animation/FadeAnimation.dart';
import 'package:dream_diary_app/Components/NavigationBar.dart';
import 'package:dream_diary_app/Dashboard/Dream%20Entry/editEntry.dart';
import 'package:dream_diary_app/Dashboard/Dream%20Entry/fullEntry.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class EntryCard extends StatelessWidget {
  final String date;
  final String title;
  final String time;
  final String description;

  const EntryCard({
    Key? key,
    required this.date,
    required this.title,
    required this.time,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      1,
      Card(
        color: Colors.white,
        elevation: 3,
        margin: const EdgeInsets.only(
          bottom: 30,
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Card Header
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(159, 134, 192, 1),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.circle_outlined,
                      size: 22,
                      color: Color.fromARGB(221, 255, 255, 255),
                    ),
                    const SizedBox(width: 10),

                    //Header Text
                    SizedBox(
                      width: 100,
                      child: Text(
                        _getHeader(),
                        style: GoogleFonts.comfortaa(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                      ),
                    ),

                    //End Text (Date)
                    Container(
                      width: 120,
                      margin: const EdgeInsets.only(left: 65),
                      child: Text(
                        _getMonthYName(date),
                        style: GoogleFonts.comfortaa(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),

              //Card Content
              Padding(
                padding: const EdgeInsets.only(
                    top: 5, bottom: 15, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Day
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Container(
                        width: 40,
                        height: 40,
                        padding: const EdgeInsets.only(top: 9),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(159, 134, 192, 1),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          _getDayNumber(),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.comfortaa(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),

                    //Main Content
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Entry Title
                          Row(
                            children: [
                              Container(
                                width: 212,
                                child: Text(
                                  title,
                                  style: GoogleFonts.comfortaa(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),

                              //More Actions Button
                              Padding(
                                padding: const EdgeInsets.only(left: 11),
                                child: IconButton(
                                  icon: const Icon(Icons.more_vert),
                                  onPressed: () => _showActions(context),
                                ),
                              ),
                            ],
                          ),

                          //Time
                          Text(
                            time,
                            style: GoogleFonts.comfortaa(
                              color: Colors.grey.shade600,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 5),
                          // Description
                          Text(
                            _getShortenedDescription(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.comfortaa(
                                color: Colors.grey.shade600, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getHeader() {
    final DateTime now = DateTime.now();
    final DateTime entryDate = DateTime.parse(date);

    if (now.year == entryDate.year &&
        now.month == entryDate.month &&
        now.day == entryDate.day) {
      return 'Today';
    } else if (now.year == entryDate.year &&
        now.month == entryDate.month &&
        now.day == entryDate.day + 1) {
      return 'Yesterday';
    } else {
      return '';
    }
  }

  String _getDayNumber() {
    return DateTime.parse(date).day.toString();
  }

  String _getShortenedDescription() {
    // Limit the description to 2 lines
    if (description.length > 50) {
      return '${description.substring(0, 50)}...';
    }
    return description;
  }

  void _showActions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text(
                'Full Entry',
                style: GoogleFonts.comfortaa(
                    color: Colors.grey.shade800,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () => _handleFullEntry(context),
            ),
            ListTile(
              title: Text(
                'Edit',
                style: GoogleFonts.comfortaa(
                    color: Colors.grey.shade800,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () => _handleEdit(context),
            ),
            ListTile(
              title: Text(
                'Delete',
                style: GoogleFonts.comfortaa(
                    color: Colors.grey.shade800,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () => _handleDelete(context),
            ),
          ],
        );
      },
    );
  }

  void _handleFullEntry(BuildContext context) {
    Navigator.pop(context);

    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(opacity: animation, child: const FullEntry());
        },
      ),
    );
  }

  void _handleEdit(BuildContext context) {
    Navigator.pop(context);

    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(
              opacity: animation,
              child: const EditEntry(
                entry: null,
              ));
        },
      ),
    );
  }

  void _handleDelete(BuildContext context) {
    _deleteEntryConfirmation(context);
  }

  Future<void> _deleteEntryConfirmation(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return FadeIn(
          1,
          AlertDialog(
            backgroundColor: Colors.white,
            title: Text('Delete entry?',
                style: GoogleFonts.comfortaa(
                    color: Colors.grey.shade700,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            content: Text(
              'Are you sure you want to delete this dream entry? :(',
              style: GoogleFonts.comfortaa(
                color: Colors.grey.shade700,
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel',
                    style: GoogleFonts.comfortaa(fontWeight: FontWeight.bold)),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 500),
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return FadeTransition(
                            opacity: animation,
                            child: const NavigationBarApp());
                      },
                    ),
                  );
                },
                child: Text(
                  'Delete',
                  style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.bold, color: Colors.red.shade300),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _getMonthYName(String date) {
    final dDate = DateTime.parse(date);
    final String monthName = DateFormat('MMMM').format(dDate);
    final String yearName = DateFormat('yyyy').format(dDate);
    final String monthYName = "$monthName $yearName";
    return monthYName;
  }
}
