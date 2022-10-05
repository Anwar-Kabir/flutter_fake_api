import 'package:flutter_fake_api/src/feature/product/details/controller/product_details_view_controller.dart';
import 'package:get/get.dart';

class ProductDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductDetailsViewController(), fenix: true);
  }
}
