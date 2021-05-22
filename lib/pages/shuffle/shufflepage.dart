import 'package:flutter/material.dart';
import 'package:fungji/controller/random_controller.dart';
import 'package:fungji/pages/shuffle/askShuffleSong.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'shufflesong.dart';

class ShufflePage extends StatefulWidget {
  @override
  _ShufflePageState createState() => _ShufflePageState();
}

class _ShufflePageState extends State<ShufflePage> {
  final randomController = Get.find<RandomController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (randomController.isTapRandom.value) {
        return ShuffleSongPage();
      } else {
        return AskShuffleSong();
      }
    });
  }
}
