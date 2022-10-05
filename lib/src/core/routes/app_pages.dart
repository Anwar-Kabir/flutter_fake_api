import 'package:flutter_fake_api/src/feature/product/details/binding/product_details_binding.dart';
import 'package:flutter_fake_api/src/feature/product/details/view/product_details_page.dart';
import 'package:get/get.dart';

part './app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    /// On boarding
    GetPage(
      name: Routes.initial,
      page: () => const ProductDetailsPage(),
      binding: ProductDetailsBinding(),
    ),
  ];
}
