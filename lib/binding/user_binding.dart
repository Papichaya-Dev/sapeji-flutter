import 'package:fungji/controller/random_controller.dart';
import 'package:fungji/controller/user_controller.dart';
import 'package:get/get.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserController());
    Get.put(RandomController());
  }
}
