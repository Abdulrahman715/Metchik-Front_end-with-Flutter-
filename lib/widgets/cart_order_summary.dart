import 'package:flutter/material.dart';
import 'package:metchik/cubit/cart/cart_states.dart';

class CartOrderSummary extends StatelessWidget {
  const CartOrderSummary({super.key, required this.state});

  final CartUpdateState state;

  @override
  Widget build(BuildContext context) {
    double shipping = 40;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Order Summary",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 10),
          _row("Subtotal", state.totalPrice),
          _row("Shipping", shipping),
          // _row("Total", state.totalPrice + shipping, isBold: true),
        ],
      ),
    );
  }

  Widget _row(String title, double value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(
            "${value.toStringAsFixed(2)} L.E",
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
