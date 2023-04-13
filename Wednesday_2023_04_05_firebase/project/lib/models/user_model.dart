import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String fullName;
  String email;
  String birthdate;
  String address;
  UserModel({
    this.id,
    required this.fullName,
    required this.email,
    required this.birthdate,
    required this.address,
  });

  Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "birthdate": birthdate,
        "address": address,
        "email": email,
      };

  factory UserModel.fromQuery(QueryDocumentSnapshot json) {
    //Object? object = json.data();
    return UserModel(
      id: json.id,
      fullName: json["full_name"],
      email: json["email"],
      birthdate: json["birthdate"],
      address: json["address"],
    );
  }
}
