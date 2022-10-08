import 'package:flutter/material.dart';

import 'view/product_ui.dart';
import 'view/single_product_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: const SingleProduct(),
        home: FakeStoreProductUi());
  }
}
