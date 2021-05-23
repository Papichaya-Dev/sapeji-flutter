import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fungji/layouts/skeletons.dart';
import 'package:fungji/services/database.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MusicLists extends StatefulWidget {
  final Stream myPlaylistStream;
  final bool isFromMyPlaylist;

  const MusicLists({Key key, this.myPlaylistStream, this.isFromMyPlaylist})
      : super(key: key);
  @override
  _MusicListsState createState() => _MusicListsState();
}

class _MusicListsState extends State<MusicLists> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: widget.myPlaylistStream,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    var docData = snapshot.data.docs[index].data();
                    return Dismissible(
                        key: UniqueKey(),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          color: Colors.red,
                          child: Icon(Icons.delete, color: Colors.white),
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20.0),
                        ),
                        onDismissed: (direction) {
                          print(direction);
                          DatabaseMethods().deleteMusicInPlaylist(ds.id);
                        },
                        child: Row(
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
                                      "lyrics": docData['lyrics'],
                                      "fromPlaylist": widget.isFromMyPlaylist,
                                    },
                                  );
                                },
                                child: Container(
                                    width: 160,
                                    height: 100,
                                    child: Image.network(
                                      ds['image'],
                                      loadingBuilder:
                                          (context, child, progress) =>
                                              progress == null
                                                  ? child
                                                  : Skeleton()
                                                      .musicThumbnailImage(),
                                      fit: BoxFit.cover,
                                    ))),
                            Divider(
                              height: 105,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed("/musicScreen", arguments: {
                                  "image": docData['image'],
                                  "title": docData['title'],
                                  "channelName": docData['channelName'],
                                  "videoID": docData['videoID'],
                                  "suggestion": docData['suggestion'],
                                  "lyrics": docData['lyrics'],
                                  "fromPlaylist": true,
                                });
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
                        ));
                  },
                )
              : Center(
                  child: Container(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator()),
                );
        });
  }
}
