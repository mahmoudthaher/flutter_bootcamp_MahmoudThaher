class ProductModel {
  int id;
  String name;
  double price;

  int quantityInStock;
  String image;
  String? description;
  int categoryId;
  int? discountId;

  ProductModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.quantityInStock,
      required this.image,
      this.description,
      required this.categoryId,
      this.discountId});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      name: json["name"],
      price: json["price"],
      quantityInStock: json["quantity_in_stock"],
      image: json["image"],
      description: json["description"],
      categoryId: json["category_id"],
      discountId: json["discount_id"],
    );
  }
}
