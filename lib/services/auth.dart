import 'package:firebase_auth/firebase_auth.dart';
import 'package:fungji/helperFunctions/sharedpref_helper.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import './database.dart';
import 'package:flutter/cupertino.dart';

class AuthMethods {
  final FirebaseAuth auth = FirebaseAuth.instance;

  getCurrentUser() async {
    return await auth.currentUser;
  }

  signInWithGoogle(BuildContext context) async {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    final GoogleSignInAccount googleSignInAccount =
        await _googleSignIn.signIn();

    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

    UserCredential result =
        await _firebaseAuth.signInWithCredential(credential);

    User userDetails = result.user;

    if (result != null) {
      Map<String, dynamic> userInfoMap = {
        "userId": userDetails.uid,
        "username": userDetails.email.split('@')[0],
        "userProfileImage": userDetails.photoURL,
        "userEmail": userDetails.email,
      };
      await SharedPreferenceHelper().saveUserEmail(userDetails.email);
      await SharedPreferenceHelper().saveUserId(userDetails.uid);
      await SharedPreferenceHelper()
          .saveUserName(userDetails.email.split('@')[0]);
      await SharedPreferenceHelper()
          .saveUserDisplayName(userDetails.displayName);
      await SharedPreferenceHelper().saveUserProfileUrl(userDetails.photoURL);

      DatabaseMethods()
          .addUserInfoToDB(userDetails.email.split('@')[0], userInfoMap)
          .then((value) {
        Get.offAndToNamed('/core');
      });
    }
  }

  // Future signOut() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.clear();
  //   await auth.signOut();
  // }
}
