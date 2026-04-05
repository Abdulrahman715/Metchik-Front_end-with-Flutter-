import 'package:flutter/material.dart';
import 'package:metchik/views/cart_view.dart';
import 'package:metchik/views/favourites_view.dart';
import 'package:metchik/views/profile_view.dart';
import 'package:metchik/widgets/custom_home_app_bar.dart';
import 'package:metchik/widgets/products_view_body.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  static const String id = 'products_view';
  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {

  int selectedPageIndex = 0;

  List<Widget> pages = [
    ProductsViewBody(),
    CartView(),
    FavouritesView(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, //! Output body underneath the BottomNavigationBar
      appBar: customHomeAppBar(),
      body:pages[selectedPageIndex],

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,//! تكييف لون الـ Container مع الوضع الليلي
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            border: Border.all(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white54
                  : Colors.grey, //! تكييف لون الحدود مع الوضع الليلي
              width: 0.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.transparent, //! إزالة الظل في الوضع الليلي
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(-3, 0), // changes position of shadow
              ),
            ],
          ),
        
          child: BottomNavigationBar(
            currentIndex: selectedPageIndex, //? لتحديد العنصر المختار
        
            //! عند الضغط على أي عنصر في الـ BottomNavigationBar، يتم تحديث selectedPageIndex لعرض الصفحة المناسبة
            onTap: (index){
              setState(() {
                selectedPageIndex = index;
              });
            },
            backgroundColor: Colors.transparent, //! لأن الـ Container هو اللي بيحدد اللون
            elevation: 0, //! إزالة الظل الافتراضي
            type: BottomNavigationBarType.fixed, //! عشان يوزع العناصر بالتساوي
            showSelectedLabels: true, //! إظهار تسمية العنصر المختار
            showUnselectedLabels: false, //! إخفاء تسمية العناصر غير المختارة
            selectedItemColor: Theme.of(context).colorScheme.onSurface, //! لون العنصر المختار
            unselectedItemColor: Colors.grey[500], //! لون العناصر غير المختارة
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
              BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favourites'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            ],
          ),
        ),
      ),
    );
  }
}