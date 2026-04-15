import 'package:flutter/material.dart';
import 'package:metchik/widgets/favourites_view_body.dart';

class FavouritesView extends StatelessWidget {
  const FavouritesView({super.key});

  static const String id = 'favourites_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Favourites',
          style: TextStyle(
            fontSize: 24, 
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: const FavouritesViewBody(),
    );
  }
}
