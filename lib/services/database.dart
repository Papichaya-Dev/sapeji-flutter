import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  var firestore = FirebaseFirestore.instance;
  Future addUserInfoToDB(
      String username, Map<String, dynamic> userInfoMap) async {
    return await firestore.collection('users').doc(username).set(userInfoMap);
  }

  Future<Stream<QuerySnapshot>> getMusicList() async {
    return await firestore.collection('musics').snapshots();
  }
}
