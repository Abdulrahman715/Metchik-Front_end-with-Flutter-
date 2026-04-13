import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metchik/cubit/favoutites/favourites_state.dart';
import 'package:metchik/model/product_model.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  FavouritesCubit() : super(FavouritesInitial());

  final List<ProductModel> _favouritesList = [];

  List<ProductModel> get favouritesItems => _favouritesList;

  //! Method to add or remove a product from favourites

  void addAndRemoveFromFavourites(ProductModel product) {
    if (_favouritesList.contains(product)) {
      _favouritesList.remove(product);
    } else {
      _favouritesList.add(product);
    }
    emit(FavouritesUpdated(List.from(_favouritesList)));
  }

  //! Method to check if a product is in favourites or not
  bool isProductInFavourites(ProductModel product) {
    return _favouritesList.contains(product);
  }
}
