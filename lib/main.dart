import 'package:flutter/material.dart';
import 'package:fungji/binding/random_binding.dart';
import 'package:fungji/controller/random_controller.dart';
import 'package:fungji/pages/homepage/musicScreen.dart';
import 'package:fungji/pages/shuffle/shufflesong1.dart';
import 'package:fungji/pages/shuffle/shufflesong2.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

import 'core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        GetPage(
          name: '/',
          page: () => Core(),
          bindings: [
            RandomBinding(),
          ],
        ),
        GetPage(
          name: '/musicScreen',
          page: () => MusicScreen(),
          bindings: [
            RandomBinding(),
          ],
        ),
        GetPage(
          name: '/shuffleSongScreen1',
          page: () => ShuffleSongPage(),
          bindings: [
            RandomBinding(),
          ],
        ),
        GetPage(
          name: '/shuffleSongScreen2',
          page: () => ShuffleSongPage2(),
          bindings: [
            RandomBinding(),
          ],
        )
      ],
    );
  }
}
