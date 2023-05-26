class ProductModel {
  int id;
  String name;
  double price;
  int quantityInStock;
  String image;
  String? description;
  int categoryId;
  int? discountId;
  int selectedQty = 1;
  double tax = 16;
  ProductModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.quantityInStock,
      required this.image,
      this.description,
      required this.categoryId,
      this.discountId});

  double get finalPrice {
    return price * (1 + (tax / 100));
  }

  double get subTotal {
    return price * selectedQty;
  }

  double get taxAmount {
    return (price * (tax / 100)) * selectedQty;
  }

  double get total {
    return (price * (1 + (tax / 100))) * selectedQty;
  }

  double get total2 => price * selectedQty;

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
  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": id,
        "qty": selectedQty,
        "price": price,
        "total": total,
      };
}
