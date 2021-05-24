import 'package:flutter/material.dart';
import 'package:fungji/layouts/musicListView.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SystemPlayList extends StatefulWidget {
  @override
  _SystemPlayListState createState() => _SystemPlayListState();
}

class _SystemPlayListState extends State<SystemPlayList> {
  var data = Get.arguments;
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
              // print('Click start');
            },
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://firebasestorage.googleapis.com/v0/b/fungji-9fb16.appspot.com/o/background-playlist.JPG?alt=media&token=7ff98a5d-52d7-4f14-9772-0f0f809095a2"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 10),
                child: Text('♬ เพลย์ลิสต์${data['list-Name']} ♬',
                    style: GoogleFonts.kanit(
                        textStyle:
                            TextStyle(color: Colors.black, fontSize: 24))),
              ),
              Expanded(
                child: MusicListView(
                  data: data,
                ),
              ),
            ],
          ),
        ));
  }
}
