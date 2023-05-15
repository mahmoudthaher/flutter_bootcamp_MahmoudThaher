class CategoryModel {
  int id;
  String category;

  CategoryModel({
    required this.id,
    required this.category,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json["id"],
      category: json["category"],
    );
  }
}
