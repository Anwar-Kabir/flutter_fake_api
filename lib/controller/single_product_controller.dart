import 'dart:convert';

import 'package:get/get.dart';

import '../model/single_product_model.dart';
import 'package:http/http.dart' as http;

class SingleProductController extends GetxController {
  Future<List<FakeStoreSingleProductModel>> fetchData() async {
    final response =
        await http.get(Uri.parse("https://fakestoreapi.com/products/1"));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
      /* return jsonResponse
          .map((e) => FakeStoreSingleProductModel.fromJson(e))
          .toList(); */

      FakeStoreSingleProductModel model =
          FakeStoreSingleProductModel.fromJson(jsonResponse);
      return [model];
    } else {
      throw Exception("Unexpected Error occured!");
    }
  }
}
