import 'package:flutter/material.dart';
import 'package:metchik/widgets/custom_home_app_bar.dart';
import 'package:metchik/widgets/products_view_body.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  static const String id = 'products_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customHomeAppBar(),
      body:ProductsViewBody(),
    );
  }
}
