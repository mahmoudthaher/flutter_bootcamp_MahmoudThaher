import 'package:project/models/status_model.dart';

class OrderModel {
  int id;
  int userId;
  int paymentMethodId;
  double total;
  double taxAmount;
  double subTotal;
  late StatusModel status;
  String? createdAt;

  OrderModel(
      {required this.id,
      required this.userId,
      required this.paymentMethodId,
      required this.total,
      required this.taxAmount,
      required this.subTotal,
      required this.status,
      this.createdAt});

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json["id"],
      userId: json["user_id"],
      paymentMethodId: json["payment_method_id"],
      total: json["total"],
      taxAmount: json["tax_amount"],
      subTotal: json["sub_total"],
      status: StatusModel.fromJson(json['status']),
      createdAt: json["created_at"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "sub_total": subTotal,
        "tax_amount": taxAmount,
        "total": total,
        "payment_method_id": paymentMethodId,
        "status": status.toJson(),
        "created_at": createdAt
      };
}
