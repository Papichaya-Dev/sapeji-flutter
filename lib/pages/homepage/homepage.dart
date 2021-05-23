import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List youtubeList = [
    {
      "image":
          "https://firebasestorage.googleapis.com/v0/b/fungji-9fb16.appspot.com/o/song_1-homepage.JPG?alt=media&token=ffd197b0-1098-4869-b415-a063b71df187",
      "title": "BUT HATE PANIC - รู้บ้างไหมเธอ ?",
      "channelName": "BUT HATE PANIC",
      "videoID": "https://youtu.be/8DSRSEIjZL4",
      "lyrics":
          "เก็บมันเอาไว้ ช่วงเวลา ก่อนที่เธอ จะจากไป\n เหลือแค่รอย น้ำตา ที่ยังคงอยู่ ไม่จางหายไป ในวันนี้จะเป็นไร\nเธอยังจำได้ใช่ไหม ว่าวันนี้คือวันพิเศษ ที่มีกับเธอ ที่ฉัน รู้ตัวว่าเธอได้เปลื่ยนไป ที่ฉัน เข้าใจทุกอย่างที่ผ่านมา ว่ามันเป็นเรื่องหลอก ที่ยังคงอยู่(ในจิตใจไม่จางไม่หาย)ว่าตัวฉันควรหยุดที่ตรงนี้ รู้บ้างไหมเธอ ว่าฉันไม่เคยได้พบใคร (ที่ดีเหมือนเธอเลยสักครั้ง)รู้บ้างไหมเธอ กับความรู้สึกที่บอกไปเป็นเพียงแค่ลม ที่พัดผ่านใจเธอ"
    },
    {
      "image":
          "https://firebasestorage.googleapis.com/v0/b/fungji-9fb16.appspot.com/o/song_2-homepage.JPG?alt=media&token=cd983d7f-688c-40d4-bd30-31f8d7543eab",
      "title": "PLASUI PLASUI - หากฉันรู้",
      "channelName": "PLASUI PLASUI",
      "videoID": "https://youtu.be/1c1wplC1Enc"
    },
    {
      "image":
          "https://firebasestorage.googleapis.com/v0/b/fungji-9fb16.appspot.com/o/song_3-homepage.JPG?alt=media&token=4e4dd1cd-4077-4939-94f1-692a387049ab",
      "title": "Don't Look Back In Anger",
      "channelName": "Oasis",
      "videoID": "https://youtu.be/r8OipmKFDeM"
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
                    var showLyrics = youtubeList[index];

                    return Row(
                      children: [
                        FlatButton(
                            onPressed: () {
                              Get.toNamed(
                                "/musicScreen",
                                arguments: {
                                  "image": showData['image'],
                                  "title": showData['title'],
                                  "channelName": showData['channelName'],
                                  "videoID": showData['videoID'],
                                  "suggestion": showData['suggestion'],
                                  "lyrics": showData['lyrics']
                                },
                              );
                            },
                            child: Container(
                                width: 160,
                                height: 100,
                                child: Image.network(
                                  showData['image'],
                                  fit: BoxFit.cover,
                                ))),
                        Divider(
                          height: 105,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(
                              "/musicScreen",
                              arguments: {
                                "image": showData['image'],
                                "title": showData['title'],
                                "channelName": showData['channelName'],
                                "videoID": showData['videoID'],
                                "suggestion": showData['suggestion'],
                                "lyrics": showData['lyrics']
                              },
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(0.1),
                            child: Column(
                              children: [
                                Text(showData['title'],
                                    style: GoogleFonts.kanit(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14))),
                                Text(showData['channelName'],
                                    style: GoogleFonts.kanit(
                                        textStyle: TextStyle(
                                            color: Colors.grey[600],
                                            fontSize: 14))),
                              ],
                            ),
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
            padding: const EdgeInsets.only(right: 200, top: 3),
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
