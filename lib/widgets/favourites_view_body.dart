import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metchik/cubit/favoutites/favourites_cubit.dart';
import 'package:metchik/cubit/favoutites/favourites_state.dart';
import 'package:metchik/model/product_model.dart';
import 'package:metchik/widgets/favourite_product_card.dart';

class FavouritesViewBody extends StatelessWidget {
  const FavouritesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouritesCubit, FavouritesState>(
      builder: (context, state) {
        List<ProductModel> favourites = [];

        if (state is FavouritesUpdated) {
          favourites = state.favouritesList;
        }

        if (favourites.isEmpty) {
          return const Center(child: Text('Your favorites list is empty!'));
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: favourites.length,
                  itemBuilder: (context, index) {
                    final product = favourites[index];
                    return FavouriteProductCard(product: product);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
