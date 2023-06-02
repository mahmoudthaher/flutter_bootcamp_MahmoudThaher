class Product {
  int id;
  String title;
  String description;
  String image;
  int qty = 0;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.image});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      image: json["image"],
    );
  }
}
