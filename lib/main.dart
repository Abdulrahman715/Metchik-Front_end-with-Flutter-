import 'package:flutter/material.dart';
import 'package:metchik/views/home_view.dart';
import 'package:metchik/views/products_view.dart';
import 'package:metchik/views/register_view.dart';

void main() {
  runApp(Metchik());
}

class Metchik extends StatelessWidget {
  const Metchik({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeView.id: (context) => HomeView(),
        ProductsView.id: (context) => ProductsView(),
        RegisterView.id: (context) => RegisterView(),
      },
      initialRoute: HomeView.id,
    );
  }
}
