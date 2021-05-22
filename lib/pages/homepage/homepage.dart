import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // TextEditingController _addItemController = TextEditingController();
  DocumentReference linkRef;
  List<String> videoID = [
    "https://www.youtube.com/watch?v=OuUNVTQTbvM",
  ];
  bool showItem = false;
  final utube =
      RegExp(r"^(https?\:\/\/)?((www\.)?youtube\.com|youtu\.?be)\/.+$");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
          ),
          Flexible(
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  child: ListView.builder(
                      itemCount: videoID.length,
                      itemBuilder: (context, index) => Container(
                            margin: EdgeInsets.all(8),
                            child: YoutubePlayer(
                              controller: YoutubePlayerController(
                                  initialVideoId: YoutubePlayer.convertUrlToId(
                                      videoID[index]),
                                  flags: YoutubePlayerFlags(
                                    autoPlay: false,
                                    enableCaption: true,
                                    hideThumbnail: false,
                                    disableDragSeek: false,
                                  )),
                              showVideoProgressIndicator: true,
                              progressIndicatorColor: Colors.blue,
                              progressColors: ProgressBarColors(
                                  playedColor: Colors.blue,
                                  handleColor: Colors.blueAccent),
                            ),
                          )))),
        ],
      ),
    );
  }

  @override
  void initState() {
    linkRef = FirebaseFirestore.instance.collection('links').doc('urls');
    super.initState();
    // getData();
    // print("https://www.youtube.com/watch?v=OuUNVTQTbvM");
  }

  // _addItemFuntion() async {
  //   await linkRef.set({
  //     _addItemController.text.toString(): _addItemController.text.toString()
  //   }, SetOptions(merge: true));
  //   Flushbar(
  //       title: 'Added',
  //       message: 'updating...',
  //       duration: Duration(seconds: 3),
  //       icon: Icon(Icons.info_outline))
  //     ..show(context);
  //   setState(() {
  //     videoID.add(_addItemController.text);
  //   });
  //   print('added');
  //   FocusScope.of(this.context).unfocus();
  //   _addItemController.clear();
  // }

  // getData() async {
  //   await linkRef
  //       .get()
  //       .then((value) => value.data()?.forEach((key, value) {
  //             if (!videoID.contains(value)) {
  //               videoID.add(value);
  //             }
  //           }))
  //       .whenComplete(() => setState(() {
  //             videoID.shuffle();
  //             showItem = true;
  //           }));
  // }
}
