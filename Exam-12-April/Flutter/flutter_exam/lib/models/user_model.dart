class UserModel {
  String? id;
  String? username;
  String? email;
  String? password;

  UserModel({
    this.id,
    this.username,
    this.email,
    this.password,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "password": password,
      };

  Map<String, dynamic> toJsonC() => {
        "username": username,
        "email": email,
        "password": password,
      };

  Map<String, dynamic> toJson2() => {
        "email": email,
        "password": password,
      };

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json["username"],
      email: json["email"],
      password: json["password"],
    );
  }
}
