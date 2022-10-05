import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class ProductRepository {
  Future<dynamic> allProducts() async {}

  Future<dynamic> productDetails(int productId) async {}
}

class ProductRepositoryImplementation implements ProductRepository {
  @override
  Future<dynamic> allProducts() async {}

  @override
  Future<dynamic> productDetails(int productId) async {
    final res = await http.get(
      Uri.parse("https://fakestoreapi.com/products/$productId"),
    );
    if (res.statusCode == 200) {
      final jsonObject = jsonDecode(res.body);
      return jsonObject;
    }
    return false;
  }
}
