import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShuffleSongPage extends StatefulWidget {
  @override
  _ShuffleSongPageState createState() => _ShuffleSongPageState();
}

class _ShuffleSongPageState extends State<ShuffleSongPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text('เพลงที่ fungji สุ่มให้คุณ.......',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.kanit(fontSize: 22))),
            Padding(
                padding: EdgeInsets.zero,
                child: Text('ในวันนี้ก็คือ . . .',
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
                print('Click for Playlist-me');
              },
              child: Text(
                'RANDOM AGAIN',
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
              color: Colors.purpleAccent[400],
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
