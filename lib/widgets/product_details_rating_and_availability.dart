import 'package:flutter/material.dart';
import 'package:metchik/constants.dart';

class ProductDetailsRatingAndAvailability extends StatelessWidget {
  const ProductDetailsRatingAndAvailability({
    super.key,
    required this.isAvailable,
  });

  final bool isAvailable;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.star, color: Colors.yellow),
              const Icon(Icons.star, color: Colors.yellow),
              const Icon(Icons.star, color: Colors.yellow),
              const Icon(Icons.star, color: Colors.yellow),
              const Icon(Icons.star_half, color: Colors.yellow),
              const SizedBox(width: 5),
              Text(
                '(124 Review)', // الرقم ده برضه المفروض ييجي من الـ Model
                style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? kPrimaryColor
                      : Colors.grey[600],
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Text(
            isAvailable ? 'Available in stock' : 'Not Available now',
            style: isAvailable
                ? TextStyle(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  )
                : const TextStyle(color: Colors.red), // if not available
          ),
        ],
      ),
    );
  }
}
