class Order {
  int id;
  String userId;
  String total;
  String createdAt;

  Order({
    required this.id,
    required this.userId,
    required this.total,
    required this.createdAt,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json["id"],
      userId: json["user_id"],
      total: json["total"],
      createdAt: json["created_at"],
    );
  }
}
