import 'package:flutter_fake_api/src/feature/product/details/controller/product_details_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsPage extends GetView<ProductDetailsViewController> {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
      ),
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (controller.hasError) {
            return const Center(
              child: Text("Opps, something went wrong"),
            );
          }
          if (controller.product == null) {
            return const Center(
              child: Text("No data found."),
            );
          }

          return Center(
            child: Text(controller.product!.title!),
          );
        }),
      ),
    );
  }
}
