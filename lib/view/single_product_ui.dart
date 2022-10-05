import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/single_product_controller.dart';
import '../model/single_product_model.dart';

class SingleProduct extends StatefulWidget {
  const SingleProduct({super.key});

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  
  late Future<List<FakeStoreSingleProductModel>> fututeData;
  SingleProductController spcfs = Get.put(SingleProductController());

  @override
  void initState() {
    super.initState();
    fututeData = spcfs.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          FutureBuilder<List<FakeStoreSingleProductModel>>(
            future: fututeData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // List<FakeStoreProductModel>? data = snapshot.data;
                // <FakeStoreSingleProductModel> data = snapshot.data;
                // snapshot.data.
                //Text(snapshot.data!.title.toString());
                var data = (snapshot.data as List<FakeStoreSingleProductModel>)
                    .toList();

                ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (((context, index) {
                      return Text(data[index].title.toString());
                    })));
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ]),
      ),
    );
  }
}
