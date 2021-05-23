import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fungji/helperFunctions/sharedpref_helper.dart';

class DatabaseMethods {
  var firestore = FirebaseFirestore.instance;
  Future addUserInfoToDB(
      String username, Map<String, dynamic> userInfoMap) async {
    return await firestore.collection('users').doc(username).set(userInfoMap);
  }

  Future<Stream<QuerySnapshot>> getMusicList() async {
    return await firestore.collection('musics').snapshots();
  }

  Future<Stream<QuerySnapshot>> getSysMusicList() async {
    return await firestore.collection('sysPlayList').snapshots();
  }

  Future<Stream<QuerySnapshot>> getMyPlaylist(username) async {
    print(username);
    return await firestore
        .collection('myPlayList')
        .where('username', isEqualTo: username)
        .snapshots();
  }

  Future addMusicToMyPlayList(Map musicInfo) async {
    return firestore.collection('myPlayList').add(musicInfo);
  }

  Future deleteMusicInPlaylist(String musicId) async {
    return firestore.collection('myPlayList').doc(musicId).delete();
  }
}
