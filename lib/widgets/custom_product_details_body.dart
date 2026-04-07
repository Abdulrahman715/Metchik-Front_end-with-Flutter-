import 'package:flutter/material.dart';
import 'package:metchik/helpers/show_snack_bar_message.dart';
import 'package:metchik/model/product_model.dart';

import 'package:metchik/widgets/product_details_image_carousel.dart';
import 'package:metchik/widgets/product_details_title_and_quantity.dart';
import 'package:metchik/widgets/product_details_rating_and_availability.dart';
import 'package:metchik/widgets/product_details_size_and_color.dart';
import 'package:metchik/widgets/product_details_description.dart';
import 'package:metchik/widgets/product_details_bottom_bar.dart';

class CustomProductDetailsBody extends StatefulWidget {
  const CustomProductDetailsBody({super.key});

  @override
  State<CustomProductDetailsBody> createState() =>
      _CustomProductDetailsBodyState();
}

class _CustomProductDetailsBodyState extends State<CustomProductDetailsBody> {
  bool isLoading = false;

  ProductModel? product; //? To hold the product details passed from the previous screen

  int currentImageIndex = 0; //? To track the currently displayed image in the carousel

  int quantity = 1; //? هنخلى 1 كقيمة ابتدائية للكمية

  bool isAvailable = true; // دي اللي هنغيرها برمجياً بعدين

  String? selectedSize; // المقاس المختار (مثلاً: 'S', 'M', 'L')
  Color? selectedColor; // اللون المختار

  //! Method to receive the product details from the previous screen and store it in the state
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Retrieve the product details passed from the previous screen
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args != null && args is ProductModel) {
      setState(() {
        product = args; // Store the product details in the state
      });
    }
  }

  void updateProductData(ProductModel updateProduct) {
    setState(() {
      product = updateProduct; // Update the product details in the state
    });
  }

  @override
  Widget build(BuildContext context) {
    if (product == null) {
      return const Center(child: CircularProgressIndicator());
    }

    double totalPrice = product!.price * quantity;

    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              ProductDetailsImageCarousel(
                product: product!,
                currentImageIndex: currentImageIndex,
                onPageChanged: (index) {
                  setState(() {
                    currentImageIndex = index;
                  });
                },
              ),
              const SizedBox(height: 20),
              ProductDetailsTitleAndQuantity(
                title: product!.title,
                quantity: quantity,
                onIncrement: () {
                  setState(() {
                    quantity++;
                  });
                },
                onDecrement: () {
                  if (quantity > 1) {
                    setState(() {
                      quantity--;
                    });
                  }
                },
              ),
              const SizedBox(height: 15),
              ProductDetailsRatingAndAvailability(
                isAvailable: isAvailable,
              ),
              const SizedBox(height: 15),
              ProductDetailsSizeAndColor(
                selectedSize: selectedSize,
                selectedColor: selectedColor,
                onSizeSelected: (size) {
                  setState(() {
                    selectedSize = size;
                  });
                },
                onColorSelected: (color) {
                  setState(() {
                    selectedColor = color;
                  });
                },
              ),
              const SizedBox(height: 20),
              ProductDetailsDescription(
                description: product!.description,
              ),
            ],
          ),
        ),
        // هنا الـ Bottom Bar الثابت اللي مش هيتحرك مع الـ Scroll
        ProductDetailsBottomBar(
          totalPrice: totalPrice,
          onAddToCart: () {
            // التحقق من أن اليوزر اختار المقاس واللون قبل الإضافة
            if (selectedSize == null || selectedColor == null) {
              showSnackBarMessage(
                context,
                message: 'Please select size and color first!',
              );
            } else {
              // هنا المنطق اللي بيبعت البيانات للكارت
              print("Adding to Cart: ${product!.title}");
              print(
                "Qty: $quantity, Size: $selectedSize, Color: $selectedColor",
              );
              //Navigator.pushNamed(context, 'cart_screen');
            }
          },
        ),
      ],
    );
  }
}
