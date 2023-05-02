class ProductModel {
  int id;
  String name;
  String image;
  double price;
  int currentQty;
  String description;
  int counter = 0;

  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.currentQty,
    required this.description,
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
      name: json["name"],
      image: json["image"],
      price: json["price"],
      currentQty: json["current_qty"],
      description: json["description"],
    );
  }
}
