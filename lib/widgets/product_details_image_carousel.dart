import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:metchik/model/product_model.dart';

class ProductDetailsImageCarousel extends StatelessWidget {
  const ProductDetailsImageCarousel({
    super.key,
    required this.product,
    required this.currentImageIndex,
    required this.onPageChanged,
  });

  final ProductModel product;
  final int currentImageIndex;
  final Function(int) onPageChanged;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 320,
            viewportFraction: 1.0,
            enlargeCenterPage: false,
            onPageChanged: (index, reason) {
              onPageChanged(index);
            },
          ),
          items: product.images.map((imageUrl) {
            return Hero(
              tag: 'Product-image- ${product.id}',
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.broken_image),
              ),
            );
          }).toList(),
        ),
        Positioned(
          top: 10,
          left: 10,
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            tooltip: 'Back to Catalog',
            icon: const Icon(Icons.arrow_circle_left_outlined),
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black, // Adjust color based on theme
            iconSize: 30,
          ),
        ),
        //! 3. زرار الـ AI Try-On (Top Right)
        Positioned(
          top: 10,
          right: 10,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.smart_toy_outlined),
            tooltip: 'AI Try-On',
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black, // Adjust color based on theme
            iconSize: 30,
          ),
        ),
        //! 4. زرار الـ favourite (bottom Left)
        Positioned(
          bottom: 10,
          right: 10,
          child: IconButton(
            onPressed: () {},
            tooltip: 'Add to Favorites',
            icon: const Icon(Icons.favorite_border),
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black, // Adjust color based on theme
            iconSize: 30,
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: product.images.asMap().entries.map((entry) {
              return Container(
                width: 8.0,
                height: 8.0,
                margin: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 4.0,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentImageIndex == entry.key
                      ? Colors.black
                      : Colors.black.withValues(alpha: 0.5),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
