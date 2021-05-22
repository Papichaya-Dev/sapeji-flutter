import 'package:fungji/controller/random_controller.dart';
import 'package:get/get.dart';

class RandomBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RandomController());
  }
}
