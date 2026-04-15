import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metchik/cubit/cart/cart_cubit.dart';
import 'package:metchik/cubit/cart/cart_states.dart';
import 'package:metchik/widgets/custom_cart_item.dart';
import 'package:metchik/widgets/cart_order_summary.dart';
import 'package:metchik/widgets/cart_checkout_section.dart';

class CartView extends StatelessWidget {
  final VoidCallback onBackToHome;

  const CartView({super.key, required this.onBackToHome});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_circle_left_outlined),
          onPressed: onBackToHome,
        ),
        title: Text(
          'Shopping Cart',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocBuilder<CartCubit, CartStates>(
        builder: (context, state) {
          if (state is CartUpdateState) {
            return _buildCartItems(context, state);
          }

          return Center(
            child: Text(
              'Your cart is empty.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCartItems(BuildContext context, CartUpdateState state) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            separatorBuilder: (_, _) => const SizedBox(height: 15),
            itemCount: state.cartItems.length,
            itemBuilder: (context, index) {
              return CustomCartItem(item: state.cartItems[index]);
            },
          ),
        ),

        CartOrderSummary(state: state),
        const SizedBox(height: 5),
        const CartCheckoutSection(),
      ],
    );
  }

}
