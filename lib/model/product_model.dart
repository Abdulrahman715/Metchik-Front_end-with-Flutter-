import 'package:metchik/model/category_model.dart';

class ProductModel {
  final int id;
  final String title;
  final String description;
  final double price;
  final List<String> images;
  final CategoryModel category;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.images,
    required this.category,
  });

  static ProductModel dummy() {
    return ProductModel(
      id: 0,
      title: 'Loading product model',
      description: 'Loading description ...... ',
      price: 0.0,
      images: [''],
      category: CategoryModel.dummy(),
    );
  }

  factory ProductModel.fromJson(json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: (json['price'] as num)
          .toDouble(), //! كده هنتأكد ان السعر هيكون دايما double حتى لو جاي int من ال API

      images: List<String>.from(
        json['images'],
      ), //! كده هنسحب كل الصور اللى فى الليست

      category: CategoryModel.fromJson(json['category']),
    );
  }
}
