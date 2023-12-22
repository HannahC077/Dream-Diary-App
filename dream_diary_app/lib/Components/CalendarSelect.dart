import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum Calendar { day, month, year }

class SingleChoice extends StatefulWidget {
  const SingleChoice({Key? key}) : super(key: key);

  @override
  State<SingleChoice> createState() => _SingleChoiceState();
}

class _SingleChoiceState extends State<SingleChoice> {
  Calendar calendarView = Calendar.month;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: Calendar.values.map((item) {
        return InkWell(
          onTap: () {
            setState(() {
              calendarView = item;
            });
          },
          child: AnimatedOpacity(
            opacity: calendarView == item ? 1.0 : 0.6,
            duration: Duration(milliseconds: 300),
            child: Material(
              borderRadius: BorderRadius.circular(35),
              color: calendarView == item
                  ? Color.fromRGBO(159, 134, 192, 1)
                  : Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 16.0,
                ),
                child: Row(
                  children: [
                    Icon(
                      item == Calendar.month
                          ? Icons.star_border_rounded
                          : (item == Calendar.month
                              ? Icons.calendar_view_month
                              : Icons.calendar_today),
                      color: calendarView == item
                          ? Colors.white
                          : Colors.grey.shade700,
                      size: 16.0,
                    ),
                    const SizedBox(width: 8.0),
                    Text(
                      item.toString().split('.').last,
                      style: GoogleFonts.comfortaa(
                        fontSize: 11,
                        color: calendarView == item
                            ? Colors.white
                            : Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
