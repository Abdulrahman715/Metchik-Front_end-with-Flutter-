import 'dart:ui';

import 'package:metchik/model/product_model.dart';

class CartItemModel {
  final ProductModel product;
  final Color color;
  final String size;
  int quantity;

  CartItemModel({
    required this.color,
    required this.size,
    required this.product,
    this.quantity = 1,
  });
}
