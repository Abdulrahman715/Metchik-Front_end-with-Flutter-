import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metchik/cubit/cart/cart_cubit.dart';
import 'package:metchik/model/cart_item_model.dart';
import 'package:metchik/widgets/custom_quantity_button.dart';

class CustomCartItem extends StatelessWidget {
  const CustomCartItem({super.key, required this.item});

  final CartItemModel item;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            item.product.images[0],
            fit: BoxFit.cover,
            height: 70,
            width: 70,
            errorBuilder: (context, error, stackTrace) => Container(
              height: 70,
              width: 70,
              color: Colors.grey[300],
              child: const Icon(Icons.image_not_supported, color: Colors.grey),
            ),
          ),
        ),
        const SizedBox(width: 16),
        // 📄 التفاصيل
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.product.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Row(
                    children: [
                      const Text(
                        'Color : ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(
                        width: 18,
                        height: 18,
                        decoration: BoxDecoration(
                          color: item.color,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Size : ${item.size}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  // ➖
                  CustomQuantityButton(
                    icon: Icons.remove,
                    onTap: () {
                      context.read<CartCubit>().decreaseQuantity(item);
                    },
                    isOutlined: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      item.quantity.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  // ➕
                  CustomQuantityButton(
                    icon: Icons.add,
                    onTap: () {
                      context.read<CartCubit>().addToCart(
                        CartItemModel(
                          product: item.product,
                          size: item.size,
                          quantity: 1,
                          color: item.color,
                        ),
                      );
                    },
                    //زر ممتلي (مش outline).
                    isOutlined: false,
                  ),
                ],
              ),
            ],
          ),
        ),
        // 💰 السعر
        Column(
          children: [
            const SizedBox(width: 15),
            // ❌ Remove button
            IconButton(
              onPressed: () {
                context.read<CartCubit>().removeFromCart(item);
              },
              icon: Icon(Icons.remove_circle_outline),
            ),
            SizedBox(height: 10),
            Text(
              "${(item.product.price * item.quantity).toStringAsFixed(2)} L.E",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
      ],
    );
  }
}
