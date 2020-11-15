import 'package:ShopX/controller/homeController.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<Homecontroller>(Homecontroller());
  }
}
