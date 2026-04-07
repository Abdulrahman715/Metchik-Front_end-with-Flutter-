import 'package:flutter/material.dart';
import 'package:metchik/constants.dart';

class ProductDetailsSizeAndColor extends StatelessWidget {
  const ProductDetailsSizeAndColor({
    super.key,
    required this.selectedSize,
    required this.onSizeSelected,
    required this.selectedColor,
    required this.onColorSelected,
  });

  final String? selectedSize;
  final Function(String) onSizeSelected;
  final Color? selectedColor;
  final Function(Color) onColorSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Size',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: ['s', 'm', 'l', 'xl', 'xxl'].map((size) {
                    bool isSelected = selectedSize == size;
                    return GestureDetector(
                      onTap: () {
                        onSizeSelected(size);
                      },
                      child: Container(
                        height: 45,
                        // width:45,
                        margin: const EdgeInsets.only(right: 8),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.black : Colors.transparent,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isSelected ? kPrimaryColor : Colors.grey,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            size.toUpperCase(),
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          // --- جزء الألوان (عمودي على اليمين) ---
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? kPrimaryColor
                  : Colors.grey.shade100, // Adjust color based on theme

              border: Border.all(
                color: Colors.grey.shade300,
              ), // Border around the color options
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                // قائمة الألوان
                ...[Colors.black, Colors.white].map((color) {
                  bool isColorSelected = selectedColor == color;
                  return GestureDetector(
                    onTap: () => onColorSelected(color),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                        border: isColorSelected
                            ? Border.all(
                                color: Colors.blue,
                                width: 2,
                              ) // برواز لو مختار
                            : Border.all(color: Colors.grey.shade300),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
