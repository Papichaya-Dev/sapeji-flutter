import 'package:get/get.dart';

class UserController extends GetxController {
  var userId = ''.obs;
  var username = 'pdayz'.obs;
  var userProfileImage = ''.obs;
  var userEmail = ''.obs;
  var count = 0.obs;

  setUserCredential(Map data) {
    print(data);
    print(data['userEmail']);
    print('xxxxxxxxxxxxxxxxxxxxxxxxxKKKKKKKKKKKKKKKKKKKKK');
    userId.value = data['userId'];
    username.value = data['username'];
    userProfileImage.value = data['userProfileImage'];
    userEmail.value = 'test';
    count++;
    update();
  }
}
