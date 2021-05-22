import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MusicScreen extends StatefulWidget {
  @override
  _MusicScreenState createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
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
          onPressed: () {
            // print('Click start');
          },
        ),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              FlatButton(
                padding: EdgeInsets.only(right: 15.0),
                disabledColor: Colors.transparent,
                onPressed: () {},
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 310, top: 10),
                      child: GestureDetector(
                          onTap: () {
                            print('Click for add Playlist');
                          },
                          child: Image.asset(
                            "assets/images/add-playlist.png",
                            width: 65,
                          )),
                    ),
                  ],
                ),
              ),
              Flexible(
                  child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      child: ListView.builder(
                          itemCount: 1,
                          itemBuilder: (context, index) => Container(
                                margin: EdgeInsets.all(8),
                                child: YoutubePlayer(
                                  controller: YoutubePlayerController(
                                      initialVideoId:
                                          YoutubePlayer.convertUrlToId(
                                              Get.arguments.toString()),
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
            ],
          ),
        ),
      ),
    );
  }
}
