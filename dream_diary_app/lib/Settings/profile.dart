import 'package:dream_diary_app/Settings/editPassword.dart';
import 'package:dream_diary_app/Settings/editProfile.dart';
import 'package:dream_diary_app/main.dart';
import 'package:flutter/material.dart';
import 'package:dream_diary_app/Animation/FadeAnimation.dart';
import 'package:dream_diary_app/Components/TileButton.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  static const String routeName = "profile";
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String username = "Haatdog"; //username

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
                height: 350,
                width: 415,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/profile_bg.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: FadeIn(
                  1,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50,
                        backgroundImage:
                            AssetImage('assets/images/default_prof.jpg'),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        //Username
                        username,
                        style: GoogleFonts.comfortaa(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
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
                              blurRadius: 20.0,
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 60,
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey[100] ?? Colors.grey,
                                  ),
                                ),
                              ),
                              child: TileButton(
                                text: "Edit Profile",
                                icon: Icons.account_circle_outlined,
                                onPressed: editProfile,
                              ),
                            ),
                            Container(
                              height: 60,
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey[100] ?? Colors.grey,
                                  ),
                                ),
                              ),
                              child: TileButton(
                                text: "Change Password",
                                icon: Icons.lock_outline,
                                onPressed: editPassword,
                              ),
                            ),
                            Container(
                              height: 60,
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey[100] ?? Colors.grey,
                                  ),
                                ),
                              ),
                              child: TileButton(
                                text: "Log Out",
                                icon: Icons.logout_outlined,
                                onPressed: () =>
                                    _showLogoutConfirmation(context),
                              ),
                            ),
                          ],
                        ),
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

  void editProfile() {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(opacity: animation, child: EditProfile());
        },
      ),
    );
  }

  void editPassword() {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(opacity: animation, child: EditPassword());
        },
      ),
    );
  }

  Future<void> _showLogoutConfirmation(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return FadeIn(
          1,
          AlertDialog(
            backgroundColor: Colors.white,
            title: Text('Log Out',
                style: GoogleFonts.comfortaa(
                    color: Colors.grey.shade700,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            content: Text('Are you sure you want to log out?',
                style: GoogleFonts.comfortaa(
                  color: Colors.grey.shade700,
                )),
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
                            opacity: animation, child: LoginScreen());
                      },
                    ),
                  );
                },
                child: Text('Log Out',
                    style: GoogleFonts.comfortaa(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        );
      },
    );
  }
}
