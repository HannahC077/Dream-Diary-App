import 'package:dream_diary_app/Animation/FadeAnimation.dart';
import 'package:dream_diary_app/Components/PasswordField.dart';
import 'package:dream_diary_app/Components/Primary%20Button.dart';
import 'package:dream_diary_app/Settings/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditPassword extends StatefulWidget {
  static const String routeName = "editPassword";

  const EditPassword({super.key});

  @override
  State<EditPassword> createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
  bool obscureText = true;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void dispose() {
    passwordController.dispose();
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
            FadeIn(
              1,
              Container(
                height: 400,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/regbackground.png'),
                        fit: BoxFit.fill)),
                child: Positioned(
                  child: FadeIn(
                    1,
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      child: Center(
                        child: Text("Update Password",
                            style: GoogleFonts.comfortaa(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            FadeIn(
              1,
              Padding(
                padding: EdgeInsets.only(left: 35.0),
                child: Row(
                  children: [
                    Text("Password",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.comfortaa(
                            color: Colors.grey.shade600,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            FadeIn(
              1,
              Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 5.0),
                child: Column(
                  children: <Widget>[
                    Container(
                        padding: const EdgeInsets.all(0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: Colors.grey.shade400,
                            width: 2.0,
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 50.0,
                              padding: const EdgeInsets.only(left: 20.0),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      color: Colors.grey[100] ?? Colors.grey),
                                ),
                              ),
                              child: PasswordField(
                                  labelText: "",
                                  hintText: "",
                                  obscureText: obscureText,
                                  onTap: setPasswordVisibility,
                                  controller: passwordController),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FadeIn(
              1,
              Padding(
                padding: EdgeInsets.only(left: 35.0),
                child: Row(
                  children: [
                    Text("Confirm Password",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.comfortaa(
                            color: Colors.grey.shade600,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            FadeIn(
              1,
              Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 5.0),
                child: Column(
                  children: <Widget>[
                    Container(
                        padding: const EdgeInsets.all(0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: Colors.grey.shade400,
                            width: 2.0,
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 50.0,
                              padding: const EdgeInsets.only(left: 20.0),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      color: Colors.grey[100] ?? Colors.grey),
                                ),
                              ),
                              child: PasswordField(
                                  labelText: "",
                                  hintText: "",
                                  obscureText: obscureText,
                                  onTap: setPasswordVisibility,
                                  controller: confirmPasswordController),
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 30,
                    ),
                    PrimaryButton(text: "Confirm", onPressed: confirm),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void confirm() {
    final password = passwordController.text.trim();
    final conPassword = confirmPasswordController.text.trim();

    if (password.isEmpty || conPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Color.fromRGBO(182, 162, 209, 1),
          behavior: SnackBarBehavior.fixed,
          content: Text("All fields are required!",
              textAlign: TextAlign.center,
              style: GoogleFonts.comfortaa(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500)),
        ),
      );
    } else if (password != conPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Color.fromRGBO(182, 162, 209, 1),
          behavior: SnackBarBehavior.fixed,
          content: Text("Passwords do not match!",
              textAlign: TextAlign.center,
              style: GoogleFonts.comfortaa(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500)),
        ),
      );
    } else {
      // Perform update logic here
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Color.fromRGBO(182, 162, 209, 1),
        behavior: SnackBarBehavior.fixed,
        content: Text("Password is updated!",
            textAlign: TextAlign.center,
            style: GoogleFonts.comfortaa(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500)),
      ));
      Navigator.pushReplacementNamed(context, Profile.routeName);
    }
  }

  void setPasswordVisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }
}
