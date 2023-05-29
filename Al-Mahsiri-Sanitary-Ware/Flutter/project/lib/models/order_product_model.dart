import 'package:project/models/product_model.dart';

class OrderProductModel {
  int id;
  int orderId;
  int productId;
  int qty;
  double price;
  ProductModel products;

  OrderProductModel({
    required this.id,
    required this.orderId,
    required this.productId,
    required this.qty,
    required this.price,
    required this.products,
  });

  factory OrderProductModel.fromJson(Map<String, dynamic> json) {
    return OrderProductModel(
        id: json["id"],
        orderId: json["order_id"],
        productId: json["product_id"],
        qty: json["qty"],
        price: double.parse(json["price"]),
        products: ProductModel.fromJson(json['product']));
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": orderId,
        "sub_total": productId,
        "qty": qty,
        "price": price,
        "product": products.toJson()
      };
}
