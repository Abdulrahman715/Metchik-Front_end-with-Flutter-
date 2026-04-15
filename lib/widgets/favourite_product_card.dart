import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metchik/cubit/favoutites/favourites_cubit.dart';
import 'package:metchik/model/product_model.dart';
import 'package:metchik/views/product_details.dart';

class FavouriteProductCard extends StatelessWidget {
  const FavouriteProductCard({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductDetails.id,
          arguments: product,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      product.images[0],
                      fit: BoxFit.cover,
                      width: double.infinity,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[200],
                          child: const Icon(Icons.broken_image,
                              size: 200, color: Colors.grey),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: IconButton(
                      icon: const Icon(Icons.favorite, color: Colors.red),
                      onPressed: () {
                        context
                            .read<FavouritesCubit>()
                            .addAndRemoveFromFavourites(product);
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              product.title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              ' ${product.price.toStringAsFixed(2)} L.E',
              style: const TextStyle(fontSize: 14, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
