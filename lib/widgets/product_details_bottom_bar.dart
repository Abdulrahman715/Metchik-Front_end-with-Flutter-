import 'package:flutter/material.dart';
import 'package:metchik/constants.dart';

class ProductDetailsBottomBar extends StatelessWidget {
  const ProductDetailsBottomBar({
    super.key,
    required this.totalPrice,
    required this.onAddToCart,
  });

  final double totalPrice;
  final VoidCallback onAddToCart;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark 
            ? Colors.black87 
            : Colors.white,
        // إضافة ظل خفيف من الأعلى ليفصل البار عن محتوى الصفحة
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.15),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: SafeArea(
        // لضمان عدم تداخله مع أزرار التنقل في الأندرويد أو الـ Notch
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // الجزء الشمال: السعر الإجمالي
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Price',
                  style: TextStyle(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? kPrimaryColor
                        : Colors.grey,
                    fontSize: 12,
                  ),
                ),
                Text(
                  '${totalPrice.toStringAsFixed(2)} L.E',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            // الجزء اليمين: زرار Add To Cart
            ElevatedButton(
              onPressed: onAddToCart,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).brightness == Brightness.dark
                    ? kPrimaryColor
                    : Colors.black, // Adjust color based on theme
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 0,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.shopping_bag_outlined,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.black
                        : Colors.white, // Adjust color based on theme
                    size: 20,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Add To Cart',
                    style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.black
                          : Colors.white, // Adjust color based on theme
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
