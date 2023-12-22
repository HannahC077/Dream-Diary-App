import 'package:dream_diary_app/Components/CustomTextFormField.dart';
import 'package:dream_diary_app/Components/DatePicker.dart';
import 'package:dream_diary_app/Components/LongTextField.dart';
import 'package:dream_diary_app/Components/NavigationBar.dart';
import 'package:dream_diary_app/Components/Primary%20Button.dart';
import 'package:dream_diary_app/Components/TimePicker.dart';
import 'package:flutter/material.dart';
import 'package:dream_diary_app/Animation/FadeAnimation.dart';
import 'package:google_fonts/google_fonts.dart';

class EditEntry extends StatefulWidget {
  static const String routeName = "edit entry";
  const EditEntry({super.key});

  @override
  State<EditEntry> createState() => _EditEntryState();
}

class _EditEntryState extends State<EditEntry> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

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
                height: 250,
                padding: const EdgeInsets.only(left: 20),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/editentry_bg.png'),
                      fit: BoxFit.fill),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
              ),
              child: FadeIn(
                1,
                FadeIn(
                  1,
                  Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(94, 84, 142, 0.2),
                              blurRadius: 8.0,
                              offset: Offset(0, 6),
                            ),
                          ],
                        ),
                        //White Container
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 410,
                              padding: const EdgeInsets.only(left: 15, top: 25),
                              alignment: Alignment.topCenter,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey[100] ?? Colors.grey,
                                  ),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    //Date Row
                                    children: [
                                      Icon(Icons.date_range_rounded,
                                          color: Colors.grey.shade700),
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        "Date",
                                        style: GoogleFonts.comfortaa(
                                            color: Colors.grey.shade700,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        width: 20.0,
                                      ),
                                      //Date Picker
                                      DatePickerComponent(),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  Row(
                                    //Time Row
                                    children: [
                                      Icon(Icons.timelapse_rounded,
                                          color: Colors.grey.shade700),
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        "Time",
                                        style: GoogleFonts.comfortaa(
                                            color: Colors.grey.shade700,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        width: 20.0,
                                      ),
                                      //Time Picker Field
                                      TimePickerComponent(
                                        initialTime: TimeOfDay.now(),
                                        onTimeSelected: (selectedTime) {
                                          // Handle the selected time here
                                          print('Selected time: $selectedTime');
                                        },
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Row(
                                    //Title Row
                                    children: [
                                      Icon(Icons.text_fields_rounded,
                                          color: Colors.grey.shade700),
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        "Title",
                                        style: GoogleFonts.comfortaa(
                                            color: Colors.grey.shade700,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              width: 200.0,
                                              height: 40,

                                              decoration: BoxDecoration(
                                                border: Border(
                                                  bottom: BorderSide(
                                                    color: Colors.grey[100] ??
                                                        Colors.grey,
                                                  ),
                                                ),
                                              ),
                                              //Title Field
                                              child: CustomTextFormField(
                                                  labelText: "",
                                                  hintText:
                                                      "Give your dream a title",
                                                  textInputType:
                                                      TextInputType.text,
                                                  controller: titleController),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Row(
                                    //Content Row
                                    children: [
                                      Icon(Icons.date_range_rounded,
                                          color: Colors.grey.shade700),
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        "Description",
                                        style: GoogleFonts.comfortaa(
                                            color: Colors.grey.shade700,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),

                                  // Content Field
                                  Container(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: LongTextField(
                                        labelText: "What was the dream about?",
                                        hintText: "",
                                        textInputType: TextInputType.text,
                                        controller: contentController),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //Save Entry Button
                      PrimaryButton(text: "Save Entry", onPressed: saveEntry),
                      const SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void saveEntry() {
    //asdsdaadsaa
    final title = titleController.text.trim();
    final content = contentController.text.trim();

    if (title.isEmpty || content.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: const Color.fromRGBO(159, 134, 192, 1),
          behavior: SnackBarBehavior.fixed,
          content: Text("Title and description are required!",
              textAlign: TextAlign.center,
              style: GoogleFonts.comfortaa(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500)),
        ),
      );
    } else {
      // Save entry logic here

      // confirm saved entry dialog box
      _saveEntryConfirmation(context);
    }
  }

  Future<void> _saveEntryConfirmation(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return FadeIn(
          1,
          AlertDialog(
            backgroundColor: Colors.white,
            title: Text('Dream updated!',
                style: GoogleFonts.comfortaa(
                    color: Colors.grey.shade700,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            content: Text(
              'Have a great day ahead!',
              style: GoogleFonts.comfortaa(
                color: Colors.grey.shade700,
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('New Entry',
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
                child: Text('OK',
                    style: GoogleFonts.comfortaa(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        );
      },
    );
  }
}
