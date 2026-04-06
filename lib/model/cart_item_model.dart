import 'dart:ui';

import 'package:metchik/model/product_model.dart';

class CartItemModel {
  final Color color;
  final String size;
  final int quantity;
  final ProductModel product;

  CartItemModel({
    required this.color,
    required this.size,
    required this.quantity,
    required this.product,
  });
}
