import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/product.dart';

class ConfigRepository extends GetxService {
  static var _client = http.Client();

  init<ConfigRepository>() async {
    await fetchProducts();
    return this;
  }

  static Future<List<Product>> fetchProducts() async {
    const _url =
        'http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline';
    var response = await _client.get(_url);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productFromMap(jsonString);
    } else {
      //show error
      return null;
    }
  }
}
