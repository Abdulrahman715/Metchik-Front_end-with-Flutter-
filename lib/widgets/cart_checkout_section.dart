import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metchik/cubit/cart/cart_cubit.dart';
import 'package:metchik/cubit/cart/cart_states.dart';

class CartCheckoutSection extends StatelessWidget {
  const CartCheckoutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartStates>(
      builder: (context, state) {
        if (state is CartUpdateState) {
          double shipping = 40;
          double total = state.totalPrice + shipping;

          return Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black12, blurRadius: 10)
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // السعر
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Total",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(
                      "${total.toStringAsFixed(2)} L.E",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                // زرار
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Proceed to Checkout",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
