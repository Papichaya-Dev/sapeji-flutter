import 'package:get/get.dart';

class UserController extends GetxController {
  var userId = ''.obs;
  var username = ''.obs;
  var userProfileImage = ''.obs;
  var userEmail = ''.obs;

  setUserCredential(Map data) {
    userId.value = data['userId'];
    username.value = data['username'];
    userProfileImage.value = data['userProfileImage'];
    userEmail.value = data['userEmail'];
  }
}
