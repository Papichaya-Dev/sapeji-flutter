import 'package:flutter/material.dart';
import 'package:fungji/pages/homepage/homepage.dart';
import 'package:fungji/pages/profile/profilepage.dart';
import 'package:fungji/pages/shuffle/shufflepage.dart';
import 'package:google_fonts/google_fonts.dart';

class Core extends StatefulWidget {
  @override
  _CoreState createState() => _CoreState();
}

class _CoreState extends State<Core> {
  int _currentIndex = 0;
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
        title: Text('fungji',
            style:
                GoogleFonts.kanit(textStyle: TextStyle(color: Colors.black))),
        actions: <Widget>[
          IconButton(
            icon: Image.asset("assets/images/logout.png"),
            onPressed: () {
              print('Click for logout');
            },
          ),
        ],
        leading: IconButton(
          icon: Image.asset("assets/images/logo.png"),
          onPressed: () {
            // print('Click start');
          },
        ),
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.grey[100],
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
                width: 40,
              ),
              title: Text("Random")),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/home.png",
                width: 50,
              ),
              title: Text("Home")),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/profile.png",
                width: 30,
              ),
              title: Text("Profile")),
        ],
      ),
    );
  }
}
