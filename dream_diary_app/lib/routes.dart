import 'package:flutter/material.dart';
import 'package:dream_diary_app/main.dart';
import 'package:dream_diary_app/Account/registration.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (BuildContext context) => const LoginScreen(),
  Registration.routeName: (BuildContext context) => const Registration(),
};
