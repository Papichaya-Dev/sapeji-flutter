import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addUserInfoToDB(
      String username, Map<String, dynamic> userInfoMap) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(username)
        .set(userInfoMap);
  }
}
