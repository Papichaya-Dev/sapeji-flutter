import 'package:flutter/material.dart';
import 'package:fungji/pages/homepage/homepage.dart';
import 'package:fungji/pages/profile/profilepage.dart';
import 'package:fungji/pages/shuffle/shufflepage.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Core extends StatefulWidget {
  @override
  _CoreState createState() => _CoreState();
}

class _CoreState extends State<Core> {
  int _currentIndex = 1;
  List<Widget> pages = [
    ShufflePage(),
    HomePage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: -5,
        backgroundColor: Colors.white,
        title: Text('sapeji',
            style:
                GoogleFonts.kanit(textStyle: TextStyle(color: Colors.black))),
        actions: <Widget>[
          IconButton(
            icon: Image.asset("assets/images/logout.png"),
            onPressed: () {
              Get.offAllNamed('/');
            },
          ),
        ],
        leading: IconButton(
          icon: Image.asset("assets/images/logo.png"),
          onPressed: () {
            Get.offAllNamed('/core');
          },
        ),
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/shuffle.png",
                width: 30,
                color: Colors.black45,
              ),
              activeIcon: Image.asset(
                "assets/images/shuffle.png",
                width: 40,
              ),
              label: "Random"),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/home.png",
                width: 25,
                color: Colors.black45,
              ),
              activeIcon: Image.asset(
                "assets/images/home.png",
                width: 40,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/profile.png",
                width: 30,
                color: Colors.black45,
              ),
              activeIcon: Image.asset(
                "assets/images/profile.png",
                width: 40,
              ),
              label: "Profile"),
        ],
      ),
    );
  }
}
