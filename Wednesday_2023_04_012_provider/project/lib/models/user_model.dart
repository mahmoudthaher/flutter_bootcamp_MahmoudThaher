class UserModel {
  int id;
  String name;
  String username;
  String email;
  String phone;
  String website;

  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "username": username,
      };

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      name: json["name"],
      username: json["username"],
      email: json["email"],
      phone: json["phone"],
      website: json["website"],
    );
  }
}
