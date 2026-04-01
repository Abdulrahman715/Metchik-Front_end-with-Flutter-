import 'package:metchik/helpers/api.dart';
import 'package:metchik/model/product_model.dart';

class UpdateProduct {
  Future<ProductModel> updateOldProduct({
    required String id,
    required String title,
    required String description,
    required double price,
    required int categoryId,
    required String images,
  }) async {
    Map<String, dynamic> body = {
      'productId':id,
      'title': title,
      'description': description,
      'price': price.toString(),
      'categoryId': categoryId.toString(),
      'images': [images],
    };

    dynamic data = await Api().postApiData(
      url: 'https://api.escuelajs.co/api/v1/products/$id',
      bodyOfPost: body,
    );

    return ProductModel.fromJson(data);
  }
}
