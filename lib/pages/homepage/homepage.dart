import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DocumentReference linkRef;
  List<String> videoID = [
    "https://www.youtube.com/watch?v=OuUNVTQTbvM",
    "https://www.youtube.com/watch?v=OuUNVTQTbvM",
  ];
  List youtubeList = [
    {
      "image":
          "https://firebasestorage.googleapis.com/v0/b/fungji-9fb16.appspot.com/o/song_1-homepage.JPG?alt=media&token=ffd197b0-1098-4869-b415-a063b71df187",
      "channelName": "BUT HATE PANIC",
      "title": "BUT HATE PANIC - รู้บ้างไหมเธอ ?"
    },
    {
      "image":
          "https://firebasestorage.googleapis.com/v0/b/fungji-9fb16.appspot.com/o/song_2-homepage.JPG?alt=media&token=cd983d7f-688c-40d4-bd30-31f8d7543eab",
      "channelName": "PLASUI PLASUI",
      "title": "PLASUI PLASUI - หากฉันรู้"
    },
    {
      "image":
          "https://firebasestorage.googleapis.com/v0/b/fungji-9fb16.appspot.com/o/song_3-homepage.JPG?alt=media&token=4e4dd1cd-4077-4939-94f1-692a387049ab",
      "channelName": "Oasis",
      "title": "Oasis - Don't Look Back In Anger"
    },
  ];
  final utube =
      RegExp(r"^(https?\:\/\/)?((www\.)?youtube\.com|youtu\.?be)\/.+$");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 200, top: 20, bottom: 10),
              child: Text('แนะนำสำหรับคุณ',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.kanit(fontSize: 22))),
          SizedBox(
            height: 300,
            child: Expanded(
              child: ListView.builder(
                  itemCount: youtubeList.length,
                  itemBuilder: (context, index) {
                    var showData = youtubeList[index];
                    return Row(
                      children: [
                        Container(
                            width: 160,
                            height: 100,
                            child: Image.network(
                              showData['image'],
                              fit: BoxFit.cover,
                            )),
                        Divider(
                          height: 105,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(showData['title'],
                                  style: GoogleFonts.kanit(
                                      textStyle: TextStyle(
                                          color: Colors.black, fontSize: 14))),
                              Text(showData['channelName'],
                                  style: GoogleFonts.kanit(
                                      textStyle: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 14))),
                            ],
                          ),
                        )
                      ],
                    );
                  }),
            ),
          ),
          Divider(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 200, top: 5, bottom: 10),
            child: Text(
              'เพลย์ลิสต์โดนใจ',
              style: GoogleFonts.kanit(
                  textStyle: TextStyle(color: Colors.black, fontSize: 22)),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) => Card(
                child: Center(
                    child: Row(
                  children: <Widget>[
                    IconButton(
                      iconSize: 220,
                      icon: Image.asset(
                        "assets/images/friend-zone-playlist.jpg",
                      ),
                      onPressed: () {
                        print('Click for Playlist-Friend-zone');
                      },
                    ),
                    IconButton(
                      iconSize: 205,
                      icon: Image.asset(
                        "assets/images/love-playlist.jpg",
                      ),
                      onPressed: () {
                        print('Click for Playlist-Love');
                      },
                    ),
                  ],
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
