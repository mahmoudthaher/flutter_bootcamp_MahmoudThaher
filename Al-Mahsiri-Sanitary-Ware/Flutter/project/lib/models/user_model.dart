class UserModel {
  String? id, gender, city, type;

  String? firstName, lastName, phoneNumber, email, username, address, password;

  UserModel(
      {this.id,
      required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      required this.email,
      required this.username,
      required this.address,
      required this.city,
      required this.gender,
      required this.type,
      required this.password});
  Map<String, dynamic> toJson() => {
        "id": id,
        "fist_name": firstName,
        "last_name": lastName,
        "phone_number": phoneNumber,
        "email": email,
        "user_name": username,
        "address": address,
        "city_id": city,
        "gender_id": gender,
        "type_id": type,
        "password": password,
      };

  Map<String, dynamic> toJsonCreate() => {
        "fist_name": firstName,
        "last_name": lastName,
        "phone_number": phoneNumber,
        "email": email,
        "user_name": username,
        "address": address,
        "city_id": city,
        "gender_id": gender,
        "type_id": type,
        "password": password,
      };
  Map<String, dynamic> toJsonCheckEmail() => {
        "email": email,
      };

  // Map<String, dynamic> toJson2() => {
  //       "email": email,
  //       "password": password,
  //     };

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      firstName: json["fist_name"],
      lastName: json["last_name"],
      phoneNumber: json["phone_number"],
      email: json["email"],
      username: json["user_name"],
      address: json["address"],
      city: json["city_id"],
      gender: json["gender_id"],
      type: json["type_id"],
      password: json["password"],
    );
  }
}
