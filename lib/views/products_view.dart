import 'package:flutter/material.dart';
import 'package:metchik/views/cart_view.dart';
import 'package:metchik/views/favourites_view.dart';
import 'package:metchik/views/profile_view.dart';
import 'package:metchik/widgets/custom_home_app_bar.dart';
import 'package:metchik/widgets/products_view_body.dart';
import 'package:metchik/widgets/custom_bottom_navigation_bar.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  static const String id = 'products_view';
  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  int selectedPageIndex = 0;

  bool get isCartPage => selectedPageIndex == 1;

  List<Widget> pages = [
    ProductsViewBody(),
    CartView(),
    FavouritesView(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,

      appBar: customHomeAppBar(),

      body: pages[selectedPageIndex],

      bottomNavigationBar: isCartPage
          ? null
          : CustomBottomNavigationBar(
              selectedPageIndex: selectedPageIndex,
              onTap: (index) {
                setState(() {
                  selectedPageIndex = index;
                });
              },
            ),
    );
  }
}
