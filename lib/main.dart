import 'package:flutter/material.dart';
import 'package:fungji/binding/random_binding.dart';
import 'package:fungji/binding/user_binding.dart';
import 'package:fungji/controller/random_controller.dart';
import 'package:fungji/controller/user_controller.dart';
import 'package:fungji/pages/authen/loginPage.dart';
import 'package:fungji/pages/homepage/SystemPlayList.dart';
import 'package:fungji/pages/homepage/musicScreen.dart';
import 'package:fungji/pages/profile/myPlaylist.dart';
import 'package:fungji/pages/shuffle/shufflesong1.dart';
import 'package:fungji/pages/shuffle/shufflesong2.dart';
import 'package:fungji/services/app_localizations.dart';
import 'package:fungji/services/auth.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Comfordaa'),
      getPages: [
        GetPage(
          name: '/',
          page: () => LoginPage(),
          bindings: [RandomBinding(), UserBinding()],
        ),
        GetPage(
          name: '/core',
          page: () => Core(),
          bindings: [RandomBinding(), UserBinding()],
        ),
        GetPage(
          name: '/musicScreen',
          page: () => MusicScreen(),
          bindings: [
            RandomBinding(),
            UserBinding(),
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
        ),
        GetPage(
          name: '/myPlaylist',
          page: () => MyPlayList(),
          bindings: [
            RandomBinding(),
          ],
        ),
        GetPage(
          name: '/sysPlayList',
          page: () => SystemPlayList(),
          bindings: [
            RandomBinding(),
          ],
        )
      ],
      supportedLocales: [
        Locale('th'),
        Locale('en'),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
    );
  }
}
