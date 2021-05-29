import 'package:flutter/material.dart';
import 'package:fungji/controller/random_controller.dart';
import 'package:fungji/helperFunctions/sharedpref_helper.dart';
import 'package:fungji/services/database.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'dart:math';

class ShuffleSongPage2 extends StatefulWidget {
  @override
  _ShuffleSongPage2State createState() => _ShuffleSongPage2State();
}

class _ShuffleSongPage2State extends State<ShuffleSongPage2> {
  final randomController = Get.find<RandomController>();
  DocumentReference linkRef;
  bool showItem = false;
  int randNum = 1;
  String username;
  Stream musicsStream;
  Map musicData;
  bool isAdd = false;

  List<String> videoID = [
    "https://youtu.be/MeGaR_2EQao",
    "https://www.youtube.com/watch?v=lY__VKI0Vs8",
    "https://www.youtube.com/watch?v=0krQNAz7kbw",
  ];

  getAllMusic() async {
    musicsStream = await DatabaseMethods().getMusicList();
    username = await SharedPreferenceHelper().getUserName();
    setState(() {});
  }

  addMusicToMyPlayList(musicInfo) {
    DatabaseMethods().addMusicToMyPlayList(musicInfo);
  }

  @override
  void initState() {
    getAllMusic();
    super.initState();
  }

  final utube =
      RegExp(r"^(https?\:\/\/)?((www\.)?youtube\.com|youtu\.?be)\/.+$");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: -5,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset(
              "assets/images/logo.png",
              width: 42,
              height: 42,
            ),
            Text('sapeji',
                style: GoogleFonts.kanit(
                    textStyle: TextStyle(color: Colors.black))),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Image.asset("assets/images/logout.png"),
            onPressed: () {
              Get.offAllNamed('/');
            },
          ),
        ],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
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
        child: Center(
          child: Container(
              child: StreamBuilder(
            stream: musicsStream,
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                randomController.setListItemCount(snapshot.data.docs.length);
                var ds =
                    snapshot.data.docs[randomController.randomSongIndex.value];
                Map<String, dynamic> newMusicData = {
                  "image": ds['image'],
                  "title": ds['title'],
                  "channelName": ds['channelName'],
                  "videoID": ds['videoID'],
                  "lyrics": ds['lyrics'],
                  "username": username
                };

                return Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Text('เพลงที่ sapeji สุ่มให้คุณ',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.kanit(fontSize: 22))),
                    Padding(
                        padding: EdgeInsets.zero,
                        child: Text('ในวันนี้ก็คือ . . .',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.kanit(
                                fontSize: 25, fontWeight: FontWeight.bold))),
                    Obx(() {
                      return Flexible(
                          child: Container(
                        margin: EdgeInsets.all(8),
                        child: YoutubePlayer(
                          controller: YoutubePlayerController(
                              initialVideoId: YoutubePlayer.convertUrlToId(
                                  snapshot.data.docs[randomController
                                      .randomSongIndex.value]['videoID']),
                              flags: YoutubePlayerFlags(
                                autoPlay: false,
                                enableCaption: true,
                              )),
                          showVideoProgressIndicator: true,
                          progressIndicatorColor: Colors.blue,
                          progressColors: ProgressBarColors(
                              playedColor: Colors.blue,
                              handleColor: Colors.blueAccent),
                        ),
                      ));
                    }),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                          snapshot.data
                                  .docs[randomController.randomSongIndex.value]
                              ['title'],
                          style: GoogleFonts.kanit(
                              fontSize: 23, fontWeight: FontWeight.bold)),
                    ),
                    Divider(
                      height: 30,
                      thickness: 1.5,
                      indent: 60,
                      endIndent: 60,
                      color: Colors.grey[450],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FlatButton(
                        onPressed: () {
                          // randomController.randomNumber();
                          randomController.randomNumber();
                          Get.offAndToNamed('/shuffleSongScreen1');
                          print('Click for Random again');
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
                        color: Colors.deepPurple[300],
                        textColor: Colors.white,
                      ),
                    ),
                    !isAdd
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FlatButton(
                              onPressed: () {
                                addMusicToMyPlayList(newMusicData);
                                Get.snackbar(
                                  'Success',
                                  'add to your playlist',
                                  titleText: Text(' Success',
                                      style: GoogleFonts.kanit(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      )),
                                  messageText: Text(
                                    '  add to your playlist',
                                    style: GoogleFonts.kanit(
                                      textStyle: TextStyle(
                                          color: Colors.grey[700],
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                );
                                setState(() {
                                  isAdd = true;
                                });
                              },
                              child: Text(
                                'ADD TO MY PLAYLIST',
                                style: GoogleFonts.kanit(
                                    textStyle: TextStyle(
                                        color: Colors.grey[900],
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                              minWidth: 230,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0)),
                              height: 50,
                              color: Colors.greenAccent[400],
                              textColor: Colors.white,
                            ),
                          )
                        : Container()
                  ],
                );
              } else {
                return Container();
              }
            },
          )),
        ),
      ),
    );
  }
}
