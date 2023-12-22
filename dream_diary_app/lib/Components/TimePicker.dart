import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimePickerComponent extends StatefulWidget {
  final Function(TimeOfDay) onTimeSelected;
  final TimeOfDay initialTime;

  const TimePickerComponent({
    Key? key,
    required this.onTimeSelected,
    required this.initialTime,
  }) : super(key: key);

  @override
  State<TimePickerComponent> createState() => _TimePickerComponentState();
}

class _TimePickerComponentState extends State<TimePickerComponent> {
  late TimeOfDay _time;
  String? _selectedTime;

  Future<void> _show() async {
    final TimeOfDay? result = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (context, child) {
          return Theme(
            data: ThemeData.light().copyWith(
              dialogBackgroundColor: Colors.white,
              colorScheme: const ColorScheme.light(
                primary: Color.fromRGBO(159, 134, 192, 1),
              ),
              timePickerTheme: const TimePickerThemeData(
                dayPeriodColor: Color.fromRGBO(159, 134, 192, 1),
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  textStyle: GoogleFonts.comfortaa(fontWeight: FontWeight.bold),
                ),
              ),
              textTheme: TextTheme(
                titleLarge: GoogleFonts.comfortaa(),
              ),
            ),
            child: child!,
          );
        });
    if (result != null) {
      setState(() {
        _selectedTime = result.format(context);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _time = widget.initialTime;
  }

  void _selectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time,
      initialEntryMode: TimePickerEntryMode.input,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
      widget.onTimeSelected(_time);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _time.format(context),
          style: GoogleFonts.comfortaa(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: const Color.fromRGBO(159, 134, 192, 1)),
        ),
        const SizedBox(
          width: 15.0,
        ),
        Container(
          width: 50.0,
          height: 30.0,
          child: ElevatedButton(
            onPressed: () => _selectTime(),
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                const EdgeInsets.only(right: 0),
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
    );
  }
}
