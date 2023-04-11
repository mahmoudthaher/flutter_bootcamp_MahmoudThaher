class UserModel {
  int? id;
  String name;
  String email;
  String username;
  int counter = 0;

  UserModel({
    required this.id,
    required this.username,
    required this.name,
    required this.email,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "username": username,
      };

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      username: json["username"],
      email: json["email"],
      name: json["name"],
    );
  }
}
