import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'single_product_controller.dart';
import 'single_product_model.dart';

class SingleProduct extends StatefulWidget {
  const SingleProduct({super.key});

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  
  late Future<FakeStoreSingleProductModel> fututeData;
  SingleProductController spcfs = Get.put(SingleProductController());

  @override
  void initState() {
    super.initState();
    fututeData = spcfs.fetchDatam();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          FutureBuilder<FakeStoreSingleProductModel>(
            future: fututeData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                
                 return Column(
                  children: [
                    Text(snapshot.data!.title.toString()),
                    Text(snapshot.data!.category.toString()),
                    Text(snapshot.data!.price.toString()),
                    Text(snapshot.data!.rating.toString()),
                    Image.network(snapshot.data!.image.toString(),
                        fit: BoxFit.cover, height: 60.0, width: 60.0)
                  ],
                ); 
                 
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ]),
      ),
    );
  }
}
