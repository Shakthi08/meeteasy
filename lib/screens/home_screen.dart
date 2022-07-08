// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meeteasy/screens/meeting_screen.dart';
import 'package:meeteasy/screens/history_meeting_screen.dart';
import 'package:meeteasy/utils/colors.dart';
import 'package:meeteasy/widgets/homeMeetingButton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    MeetingScreen(),
    const HistoryMeetingScreen(),
    Text("Contacts"),
    Text("Settings"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Meet & Chat"),
        backgroundColor: backgroundColor,
      ),
      body: pages[_page],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            indicatorColor: Color.fromARGB(255, 255, 203, 34),
            labelTextStyle: MaterialStateProperty.all(
              TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            )),
        child: NavigationBar(
          onDestinationSelected: onPageChanged,
          selectedIndex: _page,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          height: 60,
          animationDuration: Duration(seconds: 1),
          destinations: [
            NavigationDestination(
              icon: Icon(
                Icons.comment_bank_outlined,
                size: 25,
                color: Color.fromARGB(255, 255, 203, 34),
              ),
              selectedIcon: Icon(
                Icons.comment_bank,
                size: 25,
                color: Colors.white,
              ),
              label: 'Meet and chat',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.lock_clock,
                size: 25,
                color: Color.fromARGB(255, 255, 203, 34),
              ),
              selectedIcon: Icon(
                Icons.lock_clock,
                size: 25,
                color: Colors.white,
              ),
              label: 'Meetings',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.person_outline,
                size: 25,
                color: Color.fromARGB(255, 255, 203, 34),
              ),
              selectedIcon: Icon(
                Icons.person,
                size: 25,
                color: Colors.white,
              ),
              label: 'Contacts',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.settings_outlined,
                size: 25,
                color: Color.fromARGB(255, 255, 203, 34),
              ),
              selectedIcon: Icon(
                Icons.settings,
                size: 25,
                color: Colors.white,
              ),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
