import 'package:metchik/helpers/api.dart';
import 'package:metchik/model/category_model.dart';

class AllCategories {
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> data = await Api().getApiData(
      url: 'https://api.escuelajs.co/api/v1/categories',
    );

    //? advanced way

    List<CategoryModel> categoriesList = data
        .map((e) => CategoryModel.fromJson(e))
        .toList();

    return categoriesList;
  }
}
