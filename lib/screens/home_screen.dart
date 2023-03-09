import 'package:flutter/material.dart';
import 'package:products_app/screens/screens.dart';
import 'package:provider/provider.dart';

import 'package:products_app/widgets/widgets.dart';
import '../services/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductService>(context);

    if (productService.isLoading) {
      return const LoadingScreen();
    }

    final products = productService.products;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      // * ListView builder is a widget that builds a list of items on demand.
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              // * We use the copy method to create a copy of the product (this copy method is in the product model)
              productService.selectedProduct = products[index].copy();
              Navigator.pushNamed(context, '/product');
            },
            child: ProductCard(product: products[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
