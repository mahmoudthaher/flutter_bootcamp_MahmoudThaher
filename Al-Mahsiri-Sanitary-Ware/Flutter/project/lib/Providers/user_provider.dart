import 'package:flutter/material.dart';
import 'package:project/controllers/user_controller.dart';
import 'package:project/models/user_model.dart';

class UserProvider with ChangeNotifier {
  //List<UserModel> user = [];
  UserModel? user;
  createUser(
      String firstName,
      String lastName,
      String phoneNumber,
      String email,
      String username,
      String address,
      String city,
      String gender,
      String type,
      String password) {
    user = UserModel(
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        email: email,
        username: username,
        address: address,
        city: city,
        gender: gender,
        type: type,
        password: password);
    notifyListeners();
    return user;
  }

  // createUser(user) async {
  //   UserController().create(user).then((value) {
  //     notifyListeners();
  //   }).catchError((ex) {});
  // }
}
