import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metchik/cubit/favoutites/favourites_cubit.dart';
import 'package:metchik/cubit/favoutites/favourites_state.dart';
import 'package:metchik/model/product_model.dart';
import 'package:metchik/views/product_details.dart';

class CustomProductsBody extends StatelessWidget {
  const CustomProductsBody({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ProductDetails.id, arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            //! تكييف لون الـ Container مع الوضع الليلي
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
                      BlocBuilder<FavouritesCubit, FavouritesState>(
                        builder: (context, state) {
                          var cubit = context.read<FavouritesCubit>();
                          bool isFav = cubit.isProductInFavourites(product);
                          return IconButton(
                            onPressed: () {
                              //! عند الضغط على أيقونة القلب، يتم إضافة أو إزالة المنتج من قائمة المفضلة باستخدام الكيوبت 
                              cubit.addAndRemoveFromFavourites(product);
                            },
                            icon: Icon(
                              isFav ? Icons.favorite : Icons.favorite_border,
                              size: 20,
                              color: isFav ? Colors.red : Colors.grey[500],
                            ),
                          );
                        },
                      ),
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
      ),
    );
  }
}
