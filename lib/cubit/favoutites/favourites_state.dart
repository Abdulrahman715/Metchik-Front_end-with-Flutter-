import 'package:metchik/model/product_model.dart';

abstract class FavouritesState {}

class FavouritesInitial extends FavouritesState {}

class FavouritesUpdated extends FavouritesState{
  List<ProductModel> favouritesList;
  FavouritesUpdated(this.favouritesList);
}