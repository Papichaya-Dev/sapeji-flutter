import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fungji/helperFunctions/sharedpref_helper.dart';
import 'package:fungji/services/database.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String username;
  Stream musicsStream;
  Stream sysPlayListStream;

  final utube =
      RegExp(r"^(https?\:\/\/)?((www\.)?youtube\.com|youtu\.?be)\/.+$");

  getAllMusic() async {
    musicsStream = await DatabaseMethods().getMusicList();
    sysPlayListStream = await DatabaseMethods().getSysMusicList();
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
              child: StreamBuilder(
                stream: musicsStream,
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    return ListView.builder(
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot ds = snapshot.data.docs[index];
                          var docData = snapshot.data.docs[index].data();
                          if (ds['suggestion'] == true) {
                            return Row(
                              children: [
                                FlatButton(
                                    onPressed: () {
                                      Get.toNamed(
                                        "/musicScreen",
                                        arguments: {
                                          "image": docData['image'],
                                          "title": docData['title'],
                                          "channelName": docData['channelName'],
                                          "videoID": docData['videoID'],
                                          "suggestion": docData['suggestion'],
                                          "lyrics": docData['lyrics']
                                        },
                                      );
                                    },
                                    child: Container(
                                        width: 160,
                                        height: 100,
                                        child: Image.network(
                                          ds['image'],
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
                                        "image": docData['image'],
                                        "title": docData['title'],
                                        "channelName": docData['channelName'],
                                        "videoID": docData['videoID'],
                                        "suggestion": docData['suggestion'],
                                        "lyrics": docData['lyrics']
                                      },
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(0.1),
                                    child: Column(
                                      children: [
                                        Text(ds['title'],
                                            style: GoogleFonts.kanit(
                                                textStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14))),
                                        Text(ds['channelName'],
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
                          } else {
                            return Container();
                          }
                        });
                  } else {
                    return Center(
                      child: Container(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator()),
                    );
                  }
                },
              ),
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
            child: StreamBuilder(
              stream: sysPlayListStream,
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot ds = snapshot.data.docs[index];
                        var docData = snapshot.data.docs[index].data();
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed('/sysPlayList', arguments: {
                              "list": docData['list'],
                              "list-Name": docData['list-Name']
                            });
                          },
                          child: Container(
                            width: 300,
                            margin: const EdgeInsets.only(right: 20),
                            child: Image.network(
                              ds['image-Cover'],
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      });
                } else {
                  return Center(
                    child: Container(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator()),
                  );
                }
              },
            ),
          ),
          // Expanded(
          //   child: ListView.builder(
          //     shrinkWrap: true,
          //     scrollDirection: Axis.horizontal,
          //     itemCount: 1,
          //     itemBuilder: (BuildContext context, int index) => Card(
          //       child: Center(
          //           child: Row(
          //         children: <Widget>[
          //           IconButton(
          //             iconSize: 220,
          //             icon: Image.asset(
          //               "assets/images/friend-zone-playlist.jpg",
          //             ),
          //             onPressed: () {
          //               print('Click for Playlist-Friend-zone');
          //             },
          //           ),
          //           IconButton(
          //             iconSize: 205,
          //             icon: Image.asset(
          //               "assets/images/love-playlist.jpg",
          //             ),
          //             onPressed: () {
          //               print('Click for Playlist-Love');
          //             },
          //           ),
          //         ],
          //       )),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
