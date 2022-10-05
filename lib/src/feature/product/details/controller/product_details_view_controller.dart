import 'dart:developer';

import 'package:flutter_fake_api/src/feature/product/repository/product_repository.dart';
import 'package:get/get.dart';

import 'package:flutter_fake_api/src/feature/product/details/model/product_model.dart';

class ProductDetailsViewController extends GetxController {
  late final ProductRepository _repository;

  final RxBool _isLoading = false.obs;
  final RxBool _hasError = false.obs;

  bool get isLoading => _isLoading.value;
  bool get hasError => _hasError.value;

  ProductModel? product;

  @override
  onInit() {
    super.onInit();
    _repository = ProductRepositoryImplementation();
    fetchData();
  }

  Future<void> fetchData() async {
    _isLoading(true);
    final res = await _repository.productDetails(1);
    if (res.runtimeType != bool) {
      try {
        product = ProductModel.fromJson(res);
      } catch (e, stackTrace) {
        log(e.toString());
        log(stackTrace.toString());
        _hasError(true);
      }
    } else {
      _hasError(true);
    }
    _isLoading(false);
  }
}
