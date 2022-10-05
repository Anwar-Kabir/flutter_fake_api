import 'dart:convert';
import 'package:get/get.dart';
import '../model/product_model.dart';
import 'package:http/http.dart' as http;

class FakeStoreProductController extends GetxController {
  Future<List<FakeStoreProductModel>> fetchData() async {
    final response =
        await http.get(Uri.parse("https://fakestoreapi.com/products"));

    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
      return jsonResponse
          .map((e) => FakeStoreProductModel.fromJson(e))
          .toList();
    } else {
      throw Exception("Unexpected Error occured!");
    }
  }
}
