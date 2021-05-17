import 'package:flutter/material.dart';
import 'package:fungji/pages/homepage/musicScreen.dart';
import 'package:fungji/pages/shuffle/shufflesong.dart';
import 'package:get/get.dart';

import 'core.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Comfordaa'),
      getPages: [
        GetPage(name: '/', page: () => Core()),
        GetPage(name: '/musicScreen', page: () => MusicScreen()),
        GetPage(name: '/shuffleSongScreen', page: () => ShuffleSongPage())
      ],
    );
  }
}
