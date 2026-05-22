class CategoryModel {
  final int id;
  final String name;
  final String image;

  CategoryModel({required this.id, required this.name, required this.image});

  // إضافة دالة الـ dummy هنا
  static CategoryModel dummy() {
    return CategoryModel(
      id: 0,
      name: 'Category',
      image: '',
    );
  }

  factory CategoryModel.fromJson(json) {
    return CategoryModel(id: json['id'], name: json['name'], image: json['image']);
  }
}