import 'package:dream_diary_app/Components/CustomTextFormField.dart';
import 'package:dream_diary_app/Components/DatePicker.dart';
import 'package:dream_diary_app/Components/LongTextField.dart';
import 'package:dream_diary_app/Components/Primary%20Button.dart';
import 'package:flutter/material.dart';
import 'package:dream_diary_app/Animation/FadeAnimation.dart';
import 'package:google_fonts/google_fonts.dart';

class NewEntry extends StatefulWidget {
  static const String routeName = "new entry";
  const NewEntry({super.key});

  @override
  State<NewEntry> createState() => _NewEntryState();
}

class _NewEntryState extends State<NewEntry> {
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
                height: 330,
                padding: EdgeInsets.only(left: 20),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/entry_bg.png'),
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
                              height: 400,
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
                                      //Time Picker
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20.0,
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
                                        "Dream Title",
                                        style: GoogleFonts.comfortaa(
                                            color: Colors.grey.shade700,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        width: 20.0,
                                      ),
                                      //Title Field
                                      // CustomTextFormField(
                                      //     labelText: "",
                                      //     hintText: "",
                                      //     textInputType: TextInputType.text,
                                      //     controller: titleController),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20.0,
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
                                      const SizedBox(
                                        width: 20.0,
                                      ),
                                      //Content Field
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  LongTextField(
                                      labelText: "What was the dream about?",
                                      hintText: "",
                                      textInputType: TextInputType.text,
                                      controller: contentController)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      //Save Entry Button
                      PrimaryButton(text: "Save Entry", onPressed: nullFn),
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

  void nullFn() {
    //asdsdaadsaa
  }
}
