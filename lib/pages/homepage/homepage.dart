import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fungji/helperFunctions/sharedpref_helper.dart';
import 'package:fungji/layouts/musicList.dart';
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
              child: MusicLists(
                myPlaylistStream: musicsStream,
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
