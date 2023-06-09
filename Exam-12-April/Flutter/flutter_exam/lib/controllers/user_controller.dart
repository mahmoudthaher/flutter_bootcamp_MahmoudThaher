import 'package:flutter_exam/controllers/api_helper.dart';
import 'package:flutter_exam/main.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/user_model.dart';

class UserController {
  Future<bool> login(UserModel user) async {
    try {
      dynamic jsonObject =
          await ApiHelper().postRequest("api/Users/login", user.toJson2());
      String type = jsonObject["type"];
      String token = jsonObject["token"];
      print("type: $type ");
      print("token: $token ");
      final storage = FlutterSecureStorage();
      await storage.write(key: "token", value: "$type $token");
      return true;
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }

  Future<List<UserModel>> findId(String email) async {
    try {
      dynamic jsonObject =
          await ApiHelper().getRequest2("api/Users/findId/$email");
      List<UserModel> users = [];
      jsonObject.forEach((json) {
        users.add(UserModel.fromJson(json));
      });
      return users;
      // UserModel a = UserModel.fromJson(jsonObject[0]);
      // print(a.toString());
      // return a;
    } catch (ex) {
      rethrow;
    }
  }

  Future<bool> create(UserModel user) async {
    try {
      dynamic jsonObject =
          await ApiHelper().postRequest("api/Users", user.toJsonC());
      String type = jsonObject["type"];
      String token = jsonObject["token"];
      print("type: $type ");
      print("token: $token ");
      final storage = FlutterSecureStorage();
      await storage.write(key: "token", value: "$type $token");
      return true;
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }

  Future<UserModel> update(UserModel user) async {
    try {
      dynamic jsonObject =
          await ApiHelper().putRequest("api/Users", user.toJson());
      return UserModel.fromJson(jsonObject);
    } catch (ex) {
      rethrow;
    }
  }

  Future<UserModel> getUser() async {
    dynamic jsonObject = await ApiHelper().getRequest("api/users");
    return UserModel.fromJson(jsonObject);
  }
}
