import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class RandomController extends GetxController {
  var isTapRandom = false.obs;
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
}
