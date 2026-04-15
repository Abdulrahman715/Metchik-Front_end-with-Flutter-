import 'package:metchik/model/cart_item_model.dart';

abstract class CartStates {}

class CartInitialState extends CartStates {}

class CartUpdateState extends CartStates {
  final List<CartItemModel> cartItems;
  final double totalPrice;

  CartUpdateState(this.cartItems, this.totalPrice);
}