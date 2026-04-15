import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metchik/cubit/cart/cart_states.dart';
import 'package:metchik/model/cart_item_model.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInitialState());

  final List<CartItemModel> _cartItems = [];

  List<CartItemModel> get cartItems => _cartItems;

  //! حساب السعر الكلي فى اى وقت انا عاوزه
  double get totalPrice => _cartItems.fold(
    0,
    (total, item) => total + item.product.price * item.quantity,
  );

  void addToCart(CartItemModel newItem) {
    // لو المنتج موجود بالفعل فى الكارت (بنفس اللون والحجم) هنزود الكمية بس

    int index = _cartItems.indexWhere(
      (item) =>
          item.product.id == newItem.product.id &&
          item.size == newItem.size &&
          item.color == newItem.color,
    );

    if (index != -1) {
      _cartItems[index].quantity += newItem.quantity;
    } else {
      _cartItems.add(newItem);
    }

    _updateCart();
  }

  void removeFromCart(CartItemModel oldItem) {
    _cartItems.remove(oldItem);
    _updateCart();
  }

  void decreaseQuantity(CartItemModel oldItem) {
    if (oldItem.quantity > 1) {
      oldItem.quantity--;
    } else {
      _cartItems.remove(oldItem);
    }

    _updateCart();
  }

  //! 
  void _updateCart() {
    double total = 0;
    for (var item in _cartItems) {
      total += (item.product.price * item.quantity);
    }

    emit(CartUpdateState(List.from(_cartItems), total));
  }
}
