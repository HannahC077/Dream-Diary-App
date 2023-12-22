import 'package:dream_diary_app/Animation/FadeAnimation.dart';
import 'package:dream_diary_app/Dashboard/dashboard.dart';
import 'package:dream_diary_app/Dashboard/search.dart';
import 'package:dream_diary_app/Settings/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavigationBarApp extends StatefulWidget {
  static const String routeName = "navigation";

  const NavigationBarApp({super.key});

  @override
  State<NavigationBarApp> createState() => _NavigationBarAppState();
}

class _NavigationBarAppState extends State<NavigationBarApp> {
  int _currentIndex = 0;

  final screens = [
    const Dashboard(),
    const SearchPage(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      1,
      Scaffold(
        body: screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.shifting,
          backgroundColor: const Color.fromRGBO(182, 162, 209, 1),
          unselectedFontSize: 12,
          unselectedItemColor: Colors.grey.shade500,
          selectedFontSize: 14,
          selectedItemColor: const Color.fromRGBO(182, 162, 209, 1),
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.cloud_queue_outlined,
                color: Color.fromRGBO(182, 162, 209, 1),
              ),
              activeIcon:
                  Icon(Icons.cloud, color: Color.fromRGBO(115, 104, 169, 1)),
              label: "Dashboard",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Color.fromRGBO(182, 162, 209, 1),
              ),
              activeIcon: Icon(Icons.saved_search,
                  color: Color.fromRGBO(115, 104, 169, 1)),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                color: Color.fromRGBO(182, 162, 209, 1),
              ),
              activeIcon: Icon(Icons.settings_applications,
                  color: Color.fromRGBO(115, 104, 169, 1)),
              label: "Settings",
            )
          ],
          selectedLabelStyle:
              GoogleFonts.comfortaa(fontSize: 12, fontWeight: FontWeight.w600),
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
