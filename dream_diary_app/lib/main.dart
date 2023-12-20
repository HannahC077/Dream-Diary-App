import 'package:dream_diary_app/Account/registration.dart';
import 'package:dream_diary_app/Components/CustomTextFormField.dart';
import 'package:dream_diary_app/Components/PasswordField.dart';
import 'package:dream_diary_app/Components/Primary%20Button.dart';
import 'package:dream_diary_app/Components/Secondary%20Button.dart';
import 'package:flutter/material.dart';
import 'package:dream_diary_app/routes.dart';
import 'package:dream_diary_app/Animation/FadeAnimation.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    home: const LoginScreen(),
    routes: routes,
    theme: ThemeData(),
  ));
}

class LoginScreen extends StatefulWidget {
  static const String routeName = "login";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
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
            Container(
              height: 400,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/background.png'),
                      fit: BoxFit.fill)),
              child: FadeIn(
                1,
                Stack(
                  children: <Widget>[
                    Positioned(
                      left: 30,
                      width: 80,
                      height: 150,
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/light-1.png'))),
                      ),
                    ),
                    Positioned(
                      left: 120,
                      width: 80,
                      height: 120,
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/light-2.png'))),
                      ),
                    ),
                    Positioned(
                      child: FadeIn(
                        1,
                        Container(
                          margin: const EdgeInsets.only(top: 15),
                          child: Center(
                            child: Text("Dream Diary",
                                style: GoogleFonts.comfortaa(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: FadeIn(
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
                                blurRadius: 20.0,
                                offset: Offset(0, 10)),
                          ]),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    color: Colors.grey[100] ?? Colors.grey),
                              ),
                            ),
                            child: CustomTextFormField(
                                labelText: "Email Address",
                                hintText: "Enter a valid email",
                                textInputType: TextInputType.emailAddress,
                                controller: emailController),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            child: PasswordField(
                                labelText: "Password",
                                hintText: "Enter your password",
                                obscureText: obscureText,
                                onTap: setPasswordVisibility,
                                controller: passwordController),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    PrimaryButton(text: "Login", onPressed: login),
                    const SizedBox(
                      height: 30,
                    ),
                    SecondaryButton(
                        text: "Register New Account", onPressed: register),
                  ],
                ),
              ),
            ),
          ],
        )));
  }

  void nullFn() {
    //delete meee  just placeholder
  }

  void setPasswordVisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  void login() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Color.fromRGBO(182, 162, 209, 1),
          behavior: SnackBarBehavior.fixed,
          content: Text("Email address & password is required!",
              textAlign: TextAlign.center,
              style: GoogleFonts.comfortaa(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500)),
        ),
      );
    } else {
      // Perform login logic here
      // Navigator.pushReplacementNamed(context, Dashboard.routeName);
    }
  }

  void register() {
    Navigator.pushNamed(context, Registration.routeName);
  }
}
