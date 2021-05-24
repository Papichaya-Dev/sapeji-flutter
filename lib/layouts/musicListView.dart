import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fungji/layouts/skeletons.dart';
import 'package:fungji/services/database.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MusicListView extends StatefulWidget {
  final Map data;

  const MusicListView({Key key, this.data}) : super(key: key);
  @override
  _MusicListViewState createState() => _MusicListViewState();
}

class _MusicListViewState extends State<MusicListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          // print(data['list'][3]['title']);
          var ds = widget.data['list'][index];
          print(ds['channelName']);
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                FlatButton(
                    onPressed: () {
                      Get.toNamed(
                        "/musicScreen",
                        arguments: {
                          "image": ds['image'],
                          "title": ds['title'],
                          "channelName": ds['channelName'],
                          "videoID": ds['videoID'],
                          "suggestion": ds['suggestion'],
                          "lyrics": ds['lyrics'],
                          "fromPlaylist": false
                        },
                      );
                    },
                    child: Container(
                        width: 160,
                        height: 100,
                        child: Image.network(
                          ds['image'],
                          loadingBuilder: (context, child, progress) =>
                              progress == null
                                  ? child
                                  : Skeleton().musicThumbnailImage(),
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
                        "image": ds['image'],
                        "title": ds['title'],
                        "channelName": ds['channelName'],
                        "videoID": ds['videoID'],
                        "suggestion": ds['suggestion'],
                        "lyrics": ds['lyrics']
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
                                    color: Colors.black, fontSize: 16))),
                        Text(ds['channelName'],
                            style: GoogleFonts.kanit(
                                textStyle: TextStyle(
                                    color: Colors.grey[600], fontSize: 14))),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
