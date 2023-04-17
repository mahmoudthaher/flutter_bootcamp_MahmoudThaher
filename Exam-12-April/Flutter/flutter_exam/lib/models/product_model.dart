class ProductModel {
  int? id;
  String name;
  String image;
  int? currentQty;
  String description;
  int? price;

  ProductModel({
    required this.id,
    required this.description,
    required this.currentQty,
    required this.image,
    required this.name,
    required this.price,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "description": description,
        "current_qty": currentQty,
        "price": price,
      };

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      description: json["description"],
      currentQty: json["current_qty"],
      name: json["name"],
      price: json["price"],
      image: json["image"],
    );
  }
}
