import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fungji/helperFunctions/sharedpref_helper.dart';
import 'package:fungji/layouts/musicList.dart';
import 'package:fungji/layouts/skeletons.dart';
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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://firebasestorage.googleapis.com/v0/b/fungji-9fb16.appspot.com/o/background-sapeji.JPG?alt=media&token=a775ffdd-236d-4cd6-8095-1406c67c4454"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
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
                  isFromMyPlaylist: false,
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
                                loadingBuilder: (context, child, progress) =>
                                    progress == null
                                        ? child
                                        : Skeleton()
                                            .sysMusicListThumbnailImage(),
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
          ],
        ),
      ),
    );
  }
}
