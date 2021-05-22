import 'package:flutter/material.dart';
import 'package:fungji/controller/random_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AskShuffleSong extends StatefulWidget {
  @override
  _AskShuffleSongState createState() => _AskShuffleSongState();
}

class _AskShuffleSongState extends State<AskShuffleSong> {
  final randomController = Get.find<RandomController>();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text('ไม่รู้จะฟังเพลงอะไรใช่มั้ย ?',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.kanit(fontSize: 22))),
            Padding(
                padding: EdgeInsets.zero,
                child: Text('ให้ fungji ช่วยสิ',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.kanit(
                        fontSize: 25, fontWeight: FontWeight.bold))),
            (Image.asset(
              "assets/images/random.png",
              width: 320,
              alignment: Alignment.center,
            )),
            FlatButton(
              onPressed: () {
                randomController.changeIsTapRandom(true);
              },
              child: Text(
                'TAP TO RANDOM',
                style: GoogleFonts.kanit(
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ),
              minWidth: 230,
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              height: 50,
              color: Colors.indigo[400],
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
