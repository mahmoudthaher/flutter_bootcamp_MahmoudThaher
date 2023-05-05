import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:project/Providers/user_provider.dart';
import 'package:project/controllers/api_helper.dart';

import '../../models/user_model.dart';

class UserController {
  Future<bool> login(UserModel user) async {
    try {
      dynamic jsonObject =
          await ApiHelper().postRequest("api/Users/login", user.toJsonLogin());
      String type = jsonObject["type"];
      String token = jsonObject["token"];
      final storage = FlutterSecureStorage();
      await storage.write(key: "token", value: "$type $token");
      return true;
    } catch (ex) {
      rethrow;
    }
  }

  Future<UserModel> informationUser(UserModel user) async {
    try {
      dynamic jsonObject = await ApiHelper()
          .postRequest("api/Users/informationUser", user.toJsonLogin());
      // final userProvider = Provider.of<UserProvider>(context, listen: false);
      return UserModel.fromJson(jsonObject[0]);
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }

  Future<UserModel> create(UserModel user) async {
    try {
      dynamic jsonObject =
          await ApiHelper().postRequest("api/Users", user.toJsonCreate());
      return UserModel.fromJson(jsonObject);
    } catch (ex) {
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
