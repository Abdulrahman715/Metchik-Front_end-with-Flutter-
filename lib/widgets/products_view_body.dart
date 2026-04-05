import 'package:flutter/material.dart';
import 'package:metchik/services/all_products_service.dart';
import 'package:metchik/widgets/categories_list.dart';
import 'package:metchik/widgets/custom_products_body.dart';
import 'package:metchik/widgets/custom_welcome.dart';
import 'package:metchik/widgets/offers_list.dart';
import 'package:metchik/widgets/row_body_products_view.dart';

class ProductsViewBody extends StatelessWidget {
  const ProductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ListView(
        children: [
          CustomWelcome(),

          SizedBox(height: 20),

          RowBodyProductsView(),

          SizedBox(height: 40),

          CategoriesList(),

          SizedBox(height: 50),

          // تعديل الـ Slider ليصبح أفقي زي الصورة
          SizedBox(
            height: 200, // ارتفاع الكارت
            child: ListView.builder(
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return const OffersList(
                  precentage: '50',
                  subtitle: 'Everything',
                  code: 'SAVE50',
                  image:
                      'https://res.cloudinary.com/duwfy7ale/image/upload/q_auto/f_auto/v1775230612/13207620800-e2_giqsaj.jpg',
                );
              },
            ),
          ),

          SizedBox(height: 40), 

          FutureBuilder(
            future: AllProductsService().getAllProducts(),
            builder: (context, asyncSnapshot) {
              if (asyncSnapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (asyncSnapshot.hasError) {
                return Center(child: Text('Error: ${asyncSnapshot.error}'));
              } else if (!asyncSnapshot.hasData || asyncSnapshot.data!.isEmpty) {
                return Center(child: Text('No products found.'));
              } else {
                final products = asyncSnapshot.data!;
                return GridView.builder(
                clipBehavior: Clip.none,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.75,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return CustomProductsBody(
                    product: products[index],
                  );
                },
              );}
            }
          ),
        ],
      ),
    );
  }
}
