import 'package:flutter/material.dart';
import 'package:fungji/services/app_localizations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ShufflePage extends StatefulWidget {
  @override
  _ShufflePageState createState() => _ShufflePageState();
}

class _ShufflePageState extends State<ShufflePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://firebasestorage.googleapis.com/v0/b/fungji-9fb16.appspot.com/o/background-sapeji.JPG?alt=media&token=a775ffdd-236d-4cd6-8095-1406c67c4454"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 50, bottom: 10),
                  child: Text(
                      AppLocalizations.of(context)
                          .translate('dont_know_song_to_listen'),
                      textAlign: TextAlign.left,
                      style: GoogleFonts.kanit(fontSize: 22))),
              Padding(
                  padding: EdgeInsets.zero,
                  child: Text(
                      AppLocalizations.of(context).translate('our_can_help'),
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
                  // randomController.changeIsTapRandom(true);
                  Get.toNamed('/shuffleSongScreen1');
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
      ),
    );
  }
}
