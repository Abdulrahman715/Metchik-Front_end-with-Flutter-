import 'package:flutter/material.dart';
import 'package:metchik/widgets/home_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String id = 'home_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: HomeBody(),
    );
  }
}
