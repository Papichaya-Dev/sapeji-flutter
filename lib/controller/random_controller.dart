import 'package:get/get.dart';

class RandomController extends GetxController {
  RxBool isTapRandom = false.obs;

  changeIsTapRandom(bool value) {
    isTapRandom.value = value;
  }
}
