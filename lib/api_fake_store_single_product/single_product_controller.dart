import 'dart:convert';

import 'package:get/get.dart';

import 'single_product_model.dart';
import 'package:http/http.dart' as http;

class SingleProductController extends GetxController {
  Future<FakeStoreSingleProductModel> fetchDatam() async {
    final response =
        await http.get(Uri.parse("https://fakestoreapi.com/products/1"));
    if (response.statusCode == 200) {
      return FakeStoreSingleProductModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Unexpected error occured!');
    }
  }
}
