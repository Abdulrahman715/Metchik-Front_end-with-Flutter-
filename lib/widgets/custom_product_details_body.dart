import 'package:flutter/material.dart';
import 'package:metchik/constants.dart';
import 'package:metchik/helpers/show_snack_bar_message.dart';
import 'package:metchik/model/product_model.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CustomProductDetailsBody extends StatefulWidget {
  const CustomProductDetailsBody({super.key});

  @override
  State<CustomProductDetailsBody> createState() =>
      _CustomProductDetailsBodyState();
}

class _CustomProductDetailsBodyState extends State<CustomProductDetailsBody> {
  bool isLoading = false;

  ProductModel?
  product; //? To hold the product details passed from the previous screen

  int currentImageIndex =
      0; //? To track the currently displayed image in the carousel

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
      return Center(child: CircularProgressIndicator());
    }
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 320,
                      viewportFraction: 1.0,
                      enlargeCenterPage: false,
                      onPageChanged: (index, reson) {
                        setState(() {
                          currentImageIndex =
                              index; // Update the current image index when the page changes
                        });
                      },
                    ),
                    items: product!.images.map((imageUrl) {
                      return Hero(
                        tag: 'Product-image- ${product!.id}',
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          errorBuilder: (context, error, stackTrace) =>
                              Icon(Icons.broken_image),
                        ),
                      );
                    }).toList(),
                  ),

                  Positioned(
                    top: 10,
                    left: 10,

                    child: IconButton(
                      onPressed: () {},
                      tooltip: 'Back to Catalog',
                      icon: Icon(Icons.arrow_circle_left_outlined),
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
                      icon: Icon(Icons.smart_toy_outlined),
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
                      icon: Icon(Icons.favorite_border),
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
                      children: product!.images.asMap().entries.map((entry) {
                        return Container(
                          width: 8.0,
                          height: 8.0,
                          margin: EdgeInsets.symmetric(
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
              ),
              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        product!.title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black, // Adjust color based on theme
                        ),
                      ),
                    ),

                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? kPrimaryColor
                            : Colors.grey[300], // Adjust color based on theme
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              if (quantity > 1) {
                                setState(() {
                                  quantity--;
                                });
                              }
                            },
                            icon: Icon(Icons.remove),
                          ),

                          Text(quantity.toString()),

                          IconButton(
                            onPressed: () {
                              //! مش حاطين شرط علشان هو البداية والطبيعى انه هيزود
                              setState(() {
                                quantity++;
                              });
                            },
                            icon: Icon(Icons.add),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 15),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow),
                        Icon(Icons.star, color: Colors.yellow),
                        Icon(Icons.star, color: Colors.yellow),
                        Icon(Icons.star, color: Colors.yellow),
                        Icon(Icons.star_half, color: Colors.yellow),
                        SizedBox(width: 5),
                        Text(
                          '(124 Review)', // الرقم ده برضه المفروض ييجي من الـ Model
                          style: TextStyle(
                            color:
                                Theme.of(context).brightness == Brightness.dark
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
                              color:
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                            )
                          : TextStyle(color: Colors.red), // if not available
                    ),
                  ],
                ),
              ),

              SizedBox(height: 15),

              Padding(
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
                          SizedBox(height: 10),

                          Row(
                            children: ['s', 'm', 'l', 'xl', 'xxl'].map((size) {
                              bool isSelected = selectedSize == size;
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedSize = size;
                                  });
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
                                    color: isSelected
                                        ? Colors.black
                                        : Colors.transparent,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: isSelected
                                          ? kPrimaryColor
                                          : Colors.grey,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      size.toUpperCase(),
                                      style: TextStyle(
                                        color: isSelected
                                            ? Colors.white
                                            : Colors.black,
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
                            : Colors
                                  .grey
                                  .shade100, // Adjust color based on theme

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
                              onTap: () =>
                                  setState(() => selectedColor = color),
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
              ),

              SizedBox(height: 20),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 15),

                    Text(
                      product!.description,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w200,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? kPrimaryColor
                            : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // هنا الـ Bottom Bar الثابت اللي مش هيتحرك مع الـ Scroll
        buildBottomBar(),
      ],
    );
  }

  Widget buildBottomBar() {
    // حساب السعر الإجمالي تلقائياً
    double totalPrice = product!.price * quantity;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
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
              onPressed: () {
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
