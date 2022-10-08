import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../controller/product_controller.dart';
import '../model/product_model.dart';

class FakeStoreProductUi extends StatefulWidget {
  const FakeStoreProductUi({super.key});

  @override
  State<FakeStoreProductUi> createState() => _FakeStoreProductUiState();
}

class _FakeStoreProductUiState extends State<FakeStoreProductUi> {
  late Future<List<FakeStoreProductModel>> fututeData;
  FakeStoreProductController fspc = Get.put(FakeStoreProductController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fututeData = fspc.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          FutureBuilder<List<FakeStoreProductModel>>(
            future: fututeData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<FakeStoreProductModel>? data = snapshot.data;
                return Expanded(
                  child: ListView.builder(
                    itemCount: data!.length,
                    itemBuilder: ((context, index) {
                      return ListTile(
                          leading: CircleAvatar(
                              radius: 30,
                              child:
                                  Image.network(data[index].image.toString())),
                          title: Text(
                              "Product Name - ${data[index].title.toString()}"),
                          subtitle: Column(
                            children: [
                              Text("Product ID - ${data[index].id.toString()}"),
                              Text(
                                  "Product Price - ${data[index].price.toString()}"),
                              Text(
                                  "Product Disc -  ${data[index].description.toString()}"),
                              Text(
                                  "Product Categories - ${data[index].category.toString()}"),
                              Text(
                                  "Product Rate - ${data[index].rating!.rate.toString()}"),
                              Text(
                                  "Product rate count - ${data[index].rating!.count.toString()}"),
                            ],
                          ));
                    }),
                  ),
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ],
      )),
    );
  }
}