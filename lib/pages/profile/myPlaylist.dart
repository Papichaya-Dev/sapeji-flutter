import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fungji/helperFunctions/sharedpref_helper.dart';
import 'package:fungji/layouts/musicList.dart';
import 'package:fungji/services/database.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MyPlayList extends StatefulWidget {
  @override
  _MyPlayListState createState() => _MyPlayListState();
}

class _MyPlayListState extends State<MyPlayList> {
  Stream myPlaylistStream;

  onLoadingScreen() async {
    String username = await SharedPreferenceHelper().getUserName();
    myPlaylistStream = await DatabaseMethods().getMyPlaylist(username);
    setState(() {});
  }

  @override
  void initState() {
    onLoadingScreen();
    super.initState();
  }

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
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 24, bottom: 14),
                child: Text('เพลย์ลิสต์ของฉัน',
                    style: GoogleFonts.kanit(
                        textStyle:
                            TextStyle(color: Colors.black, fontSize: 24))),
              ),
              MusicLists(
                myPlaylistStream: myPlaylistStream,
              )
            ],
          ),
        ),
      ),
    );
  }
}
