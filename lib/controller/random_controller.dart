import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class RandomController extends GetxController {
  var isTapRandom = false.obs;
  List<String> videoID = [
    "https://youtu.be/MeGaR_2EQao",
    "https://www.youtube.com/watch?v=lY__VKI0Vs8",
    "https://www.youtube.com/watch?v=0krQNAz7kbw",
  ];
  var randomSongIndex = 0.obs;
  var listItemCount = 0.obs;

  changeIsTapRandom(bool value) {
    isTapRandom.value = value;
  }

  setListItemCount(value) {
    listItemCount.value = value;
  }

  randomNumber() {
    Random random = new Random();
    int oldNum = randomSongIndex.value;
    int newRandom;
    do {
      newRandom = random.nextInt(listItemCount.value);
    } while (newRandom == oldNum);
    randomSongIndex.value = newRandom;
  }

  Widget getRandomSong() {
    Random random = new Random();
    int newRandom;
    do {
      newRandom = random.nextInt(videoID.length);
    } while (newRandom == randomSongIndex.value);
    randomSongIndex.value = newRandom;
    return YoutubePlayer(
      controller: YoutubePlayerController(
          initialVideoId:
              YoutubePlayer.convertUrlToId(videoID[randomSongIndex.value]),
          flags: YoutubePlayerFlags(
            autoPlay: false,
            enableCaption: true,
          )),
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.blue,
      progressColors: ProgressBarColors(
          playedColor: Colors.blue, handleColor: Colors.blueAccent),
    );

    // return Text('$randomSongIndex');
  }
}
