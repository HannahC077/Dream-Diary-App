import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DatePickerComponent extends StatefulWidget {
  const DatePickerComponent({Key? key}) : super(key: key);

  @override
  State<DatePickerComponent> createState() => _DatePickerComponentState();
}

class _DatePickerComponentState extends State<DatePickerComponent> {
  DateTime selectedDate = DateTime.now();
  final DateFormat _dateFormat = DateFormat('MMMM d, y');

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            dialogBackgroundColor: Colors.white,
            colorScheme: const ColorScheme.light(
              primary: Color.fromRGBO(159, 134, 192, 1),
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                textStyle: GoogleFonts.comfortaa(fontWeight: FontWeight.bold),
              ),
            ),
            textTheme: TextTheme(
              headlineLarge: GoogleFonts.comfortaa(),
              titleLarge: GoogleFonts.comfortaa(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade700,
              ),
              titleSmall: GoogleFonts.comfortaa(),
              bodyLarge: GoogleFonts.comfortaa(
                fontSize: 13.0,
                color: Colors.black,
              ),
              labelLarge: GoogleFonts.comfortaa(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            _dateFormat.format(selectedDate),
            style: GoogleFonts.comfortaa(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(159, 134, 192, 1)),
          ),
          const SizedBox(
            width: 15.0,
          ),
          Container(
            width: 50.0,
            height: 30.0,
            child: ElevatedButton(
              onPressed: () => _selectDate(context),
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  EdgeInsets.only(right: 0),
                ),
                backgroundColor: MaterialStateProperty.all(Colors.white),
              ),
              child: const Icon(
                Icons.edit,
                size: 18.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
