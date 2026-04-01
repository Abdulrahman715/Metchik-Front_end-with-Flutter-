
import 'package:metchik/helpers/api.dart';
import 'package:metchik/model/product_model.dart';

class AllProductsService {
  Future<List<ProductModel>> getAllProducts() async {

    List<dynamic> data = await Api().getApiData(
      url: 'https://api.escuelajs.co/api/v1/products',
    );

    List<ProductModel> productsList = data
        .map((e) => ProductModel.fromJson(e))
        .toList();

    return productsList;
  }
}
