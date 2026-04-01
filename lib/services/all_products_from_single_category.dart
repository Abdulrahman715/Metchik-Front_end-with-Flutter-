import 'package:metchik/helpers/api.dart';
import 'package:metchik/model/product_model.dart';

class AllProductsFromSingleCategory {
  Future<List<ProductModel>> getProductsFromSingleCategory({
    required int categoryId,
  }) async {

    List<dynamic> data = await Api().getApiData(
      url: 'https://api.escuelajs.co/api/v1/categories/$categoryId',
    );

    List<ProductModel> productsList = data
        .map((e) => ProductModel.fromJson(e))
        .toList();

    return productsList;
  }
}
