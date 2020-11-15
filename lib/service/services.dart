import 'package:get/get.dart';

import 'configuration.dart';

Future<void> initServices() async {
  Get.put(() => ConfigRepository().init());
}
