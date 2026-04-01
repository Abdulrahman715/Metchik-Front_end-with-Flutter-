import 'package:metchik/helpers/api.dart';
import 'package:metchik/model/product_model.dart';

class AddProduct {
  Future<ProductModel> addNewProduct({
    required String title,
    required String description,
    required double price,
    required int categoryId,
    required String images,
  }) async {
    Map<String, dynamic> body = {
      'title': title,
      'description': description,
      'price': price.toString(),
      'categoryId': categoryId.toString(),
      'images': [images],
    };

    dynamic data = await Api().postApiData(
      url: 'https://api.escuelajs.co/api/v1/products/',
      bodyOfPost: body,
    );

    return ProductModel.fromJson(data);
  }
}
