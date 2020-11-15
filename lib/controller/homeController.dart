import 'package:get/get.dart';

import '../models/product.dart';
import '../service/configuration.dart';

enum ListType { Grid, Tiles }

class Homecontroller extends GetxController {
  var productList = List<Product>();
  bool isLoading = false;
  ListType listType = ListType.Tiles;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    isLoading = true;
    try {
      var products = await ConfigRepository.fetchProducts();
      if (products != null) {
        productList = products;
      }
    } finally {
      isLoading = false;
    }
    update();
  }

  void changeToList() {
    listType = ListType.Grid;
    update();
  }

  void changeToTile() {
    listType = ListType.Tiles;
    update();
  }
}
