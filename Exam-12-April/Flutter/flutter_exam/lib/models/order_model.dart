class OrderModel {
  int? id;
  int? userId;
  int? statusId;
  String? address;
  int? total;

  OrderModel({
    this.id,
    this.userId,
    this.statusId,
    this.address,
    this.total,
  });

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "status_id": statusId,
        "address": address,
        "total": total,
      };

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json["id"],
      userId: json["user_id"],
      statusId: json["status_id"],
      address: json["address"],
      total: json["total"],
    );
  }
}
