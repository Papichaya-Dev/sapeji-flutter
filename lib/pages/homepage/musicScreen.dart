import 'package:flutter/material.dart';
import 'package:fungji/helperFunctions/sharedpref_helper.dart';
import 'package:fungji/services/database.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MusicScreen extends StatefulWidget {
  @override
  _MusicScreenState createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  var data = Get.arguments;
  String username;
  Stream musicsStream;
  Map musicData;
  bool isAdd = false;
  YoutubePlayerController _controller;

  getUsername() async {
    username = await SharedPreferenceHelper().getUserName();
    setState(() {});
  }

  addMusicToMyPlayList(musicInfo) {
    DatabaseMethods().addMusicToMyPlayList(musicInfo);
    isAdd = true;
    setState(() {});
  }

  @override
  void initState() {
    getUsername();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(data['videoID']),
      flags: YoutubePlayerFlags(
        autoPlay: true,
        enableCaption: true,
      ),
    );
    super.initState();
  }

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
                "https://firebasestorage.googleapis.com/v0/b/fungji-9fb16.appspot.com/o/background_sapeji_2.JPG?alt=media&token=8a254e60-3b67-43da-a84a-d3eec8c3bfed"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    data['fromPlaylist'] == false && isAdd == false
                        ? FlatButton(
                            disabledColor: Colors.transparent,
                            onPressed: () {},
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 10, left: 275),
                                  child: GestureDetector(
                                      onTap: () {
                                        Map<String, dynamic> newMusicData = {
                                          ...data,
                                          "username": username
                                        };

                                        Get.snackbar(
                                          'Success',
                                          'add to your playlist',
                                          titleText: Text(' Success',
                                              style: GoogleFonts.kanit(
                                                textStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w600),
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
                                        addMusicToMyPlayList(newMusicData);
                                      },
                                      child: Image.asset(
                                        "assets/images/add-playlist.png",
                                        width: 65,
                                      )),
                                ),
                              ],
                            ),
                          )
                        : SizedBox(
                            height: 68,
                          )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Flexible(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      child: YoutubePlayer(
                        controller: _controller,
                        showVideoProgressIndicator: true,
                        progressIndicatorColor: Colors.blue,
                        progressColors: ProgressBarColors(
                            playedColor: Colors.blue,
                            handleColor: Colors.blueAccent),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    child: Text(
                      data['title'],
                      textAlign: TextAlign.center,
                      style: GoogleFonts.kanit(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'เนื้อเพลง',
                    style: GoogleFonts.kanit(
                      textStyle: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: Container(
                  margin: const EdgeInsets.only(bottom: 10, left: 10),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: data['lyrics'].toString().split("*//").length,
                    itemBuilder: (ctx, index) {
                      var allText = data['lyrics'].toString().split("*//");
                      return Row(
                        children: [
                          Text(
                            allText[index],
                            style: GoogleFonts.kanit(
                              textStyle:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
