import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (Image.asset(
                "assets/images/profile-profilepage.png",
                width: 80,
                alignment: Alignment.center,
              )),
              Text(' fungji#1\n lo0kpad@hotmail.com',
                  style: GoogleFonts.kanit(
                      textStyle: TextStyle(color: Colors.black, fontSize: 16))),
              Padding(
                padding: EdgeInsets.all(40),
              ),
              Divider(
                height: 120,
              ),
            ],
          ),
          Divider(
            height: 30,
            thickness: 2,
            indent: 40,
            endIndent: 40,
            color: Colors.grey[450],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                padding: EdgeInsets.only(right: 15.0),
                disabledColor: Colors.transparent,
                onPressed: () {},
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      iconSize: 80,
                      icon: Image.asset(
                        "assets/images/playlist.png",
                      ),
                      onPressed: () {
                        print('Click for Playlist-me');
                      },
                    ),
                    new Text(' เพลย์ลิสต์ของฉัน',
                        style: GoogleFonts.kanit(
                            textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ))),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(40),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                padding: EdgeInsets.only(left: 15.0),
                disabledColor: Colors.transparent,
                onPressed: () {},
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      iconSize: 80,
                      icon: Image.asset(
                        "assets/images/playlist.png",
                      ),
                      onPressed: () {
                        print('Click for Playlist-friendzone');
                      },
                    ),
                    new Text(' เพลย์ลิสต์เฟรนด์โซน',
                        style: GoogleFonts.kanit(
                            textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ))),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(40),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
