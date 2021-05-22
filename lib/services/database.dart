import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fungji/helperFunctions/sharedpref_helper.dart';

class DatabaseMethods {
  var firestore = FirebaseFirestore.instance;
  var username = SharedPreferenceHelper().getUserName();
  Future addUserInfoToDB(
      String username, Map<String, dynamic> userInfoMap) async {
    return await firestore.collection('users').doc(username).set(userInfoMap);
  }

  Future<Stream<QuerySnapshot>> getMusicList() async {
    return await firestore.collection('musics').snapshots();
  }

  Future addMusicToMyPlayList(Map musicInfo) async {
    print(musicInfo);
    print('zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz');
    return firestore.collection('myPlayList').add(musicInfo);
  }
}
