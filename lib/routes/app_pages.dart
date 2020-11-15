import 'package:ShopX/binding/home_binding.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../view_models/homePage/homePage.dart';

part 'app_routes.dart';

class AppPages {
  static const INITAL = Routes.HOME;
  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => Homepage(
        homecontroller: Get.find(),
      ),
      binding: HomeBinding(),
    ),
  ];
}
