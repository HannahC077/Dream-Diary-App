import 'package:dream_diary_app/Settings/editPassword.dart';
import 'package:dream_diary_app/Settings/editProfile.dart';
import 'package:dream_diary_app/Settings/profile.dart';
import 'package:flutter/material.dart';
import 'package:dream_diary_app/main.dart';
import 'package:dream_diary_app/Account/registration.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (BuildContext context) => const LoginScreen(),
  Registration.routeName: (BuildContext context) => const Registration(),
  Profile.routeName: (BuildContext context) => const Profile(),
  EditProfile.routeName: (BuildContext context) => const EditProfile(),
  EditPassword.routeName: (BuildContext context) => const EditPassword(),
};
