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
          title: Text('fungji',
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
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 10),
              child: Text('เพลย์ลิสท์${data['list-Name']}',
                  style: GoogleFonts.kanit(
                      textStyle: TextStyle(color: Colors.black, fontSize: 24))),
            ),
            Expanded(
              child: MusicListView(
                data: data,
              ),
            ),
          ],
        ));
  }
}
