class OrderModel {
  int? id;
  int? userId;
  int? statusId;
  String? address;
  int? total;
  String? createdAt;

  OrderModel(
      {this.id,
      this.userId,
      this.statusId,
      this.address,
      this.total,
      this.createdAt});

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "status_id": statusId,
        "address": address,
        "total": total,
        "created_at": createdAt,
      };

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json["id"],
      userId: json["user_id"],
      statusId: json["status_id"],
      address: json["address"],
      total: json["total"],
      createdAt: json["created_at"],
    );
  }
}
