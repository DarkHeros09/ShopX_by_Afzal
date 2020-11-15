import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes/app_pages.dart';
import 'service/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      getPages: AppPages.routes,
      initialRoute: AppPages.INITAL,
    );
  }
}
