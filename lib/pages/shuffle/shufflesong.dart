import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ShuffleSongPage extends StatefulWidget {
  @override
  _ShuffleSongPageState createState() => _ShuffleSongPageState();
}

class _ShuffleSongPageState extends State<ShuffleSongPage> {
  DocumentReference linkRef;

  List<String> videoID = ["https://youtu.be/MeGaR_2EQao"];
  bool showItem = false;
  final utube =
      RegExp(r"^(https?\:\/\/)?((www\.)?youtube\.com|youtu\.?be)\/.+$");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: -5,
        backgroundColor: Colors.white,
        title: Text('fungji',
            style:
                GoogleFonts.kanit(textStyle: TextStyle(color: Colors.black))),
        actions: <Widget>[
          IconButton(
            icon: Image.asset("assets/images/logout.png"),
            onPressed: () {
              print('Click for logout');
            },
          ),
        ],
        leading: IconButton(
          icon: Image.asset("assets/images/logo.png"),
          onPressed: () {},
        ),
      ),
      body: Center(
        child: Container(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text('เพลงที่ fungji สุ่มให้คุณ',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.kanit(fontSize: 22))),
              Padding(
                  padding: EdgeInsets.zero,
                  child: Text('ในวันนี้ก็คือ . . .',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.kanit(
                          fontSize: 25, fontWeight: FontWeight.bold))),
              Flexible(
                  child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      child: ListView.builder(
                          itemCount: videoID.length,
                          itemBuilder: (context, index) => Container(
                                margin: EdgeInsets.all(8),
                                child: YoutubePlayer(
                                  controller: YoutubePlayerController(
                                      initialVideoId:
                                          YoutubePlayer.convertUrlToId(
                                              videoID[index]),
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
                              )))),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                  onPressed: () {
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
                  color: Colors.purpleAccent[400],
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//  @override
//   void initState() {
//     linkRef = FirebaseFirestore.instance.collection('links').doc('urls');
//     super.initState();
//     // getData();
//     // print("https://www.youtube.com/watch?v=OuUNVTQTbvM");
//   }

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
// }
