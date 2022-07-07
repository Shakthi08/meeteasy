// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Meet & Chat"),
        backgroundColor: backgroundColor,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeMeetingButton(
                onPressed: () {},
                text: 'New meeting',
                icon: Icons.videocam,
              ),
              HomeMeetingButton(
                onPressed: () {},
                text: 'Join meeting',
                icon: Icons.add_box_rounded,
              ),
              HomeMeetingButton(
                onPressed: () {},
                text: 'Schedule meeting',
                icon: Icons.calendar_today,
              ),
              HomeMeetingButton(
                onPressed: () {},
                text: 'Share screen',
                icon: Icons.arrow_upward_rounded,
              )
            ],
          ),
          const Expanded(
            child: Center(
              child: Text(
                'Create or join a meeting',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
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
                color: Color.fromARGB(255, 255, 203, 34),
              ),
              selectedIcon: Icon(
                Icons.comment_bank,
                color: Colors.white,
              ),
              label: 'Meet and chat',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.lock_clock,
                size: 30,
                color: Color.fromARGB(255, 255, 203, 34),
              ),
              selectedIcon: Icon(
                Icons.lock_clock,
                color: Colors.white,
              ),
              label: 'Meetings',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.person_outline,
                size: 30,
                color: Color.fromARGB(255, 255, 203, 34),
              ),
              selectedIcon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: 'Contacts',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.settings_outlined,
                size: 30,
                color: Color.fromARGB(255, 255, 203, 34),
              ),
              selectedIcon: Icon(
                Icons.settings,
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
