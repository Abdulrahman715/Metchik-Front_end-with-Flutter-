import 'package:flutter/material.dart';
import 'package:metchik/model/product_model.dart';

class CustomProductsBody extends StatelessWidget {
  const CustomProductsBody({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black26, width: 1),
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(1, 3), // changes position of shadow
              ),
            ],
          ),
          child: Card(
            color: Colors.transparent,
            elevation: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  product.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '${product.price} EGP',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.favorite, size: 20, color: Colors.grey[500]),
                  ],
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
        Positioned(
          top: 5, // ارفعه لفوق شوية عشان يدي شكل الـ 3D
          right: 0,
          left: 0,
          child: Image.network(
            product.images[0],
            height: 120,
            width: 120,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              // لو الصورة فشلت، يعرض أيقونة بديلة بدل ما يطلع Error
              return const Icon(
                Icons.broken_image,
                size: 100,
                color: Colors.grey,
              );
            },
          ),
        ),
      ],
    );
  }
}
