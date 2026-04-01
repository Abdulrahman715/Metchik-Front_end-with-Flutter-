import 'package:metchik/helpers/api.dart';

class DeleteProduct {
  Future<dynamic> deleteOldProduct({required String productId}) async {
    dynamic data = await Api().deleteApiData(
      url: 'https://api.escuelajs.co/api/v1/products/$productId',
    );

    if (data == true) {
      return 'Product deleted Successfully';
    } else {
      return 'Something error';
    }
  }
}
