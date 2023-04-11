import 'package:blocapp/controller/api_helper.dart';
import 'package:blocapp/models/user_model.dart';

class UserController {
  Future<List<UserModel>> getUser() async {
    dynamic jsonObject = await ApiHelper().getRequest("users");
    List<UserModel> users = [];
    jsonObject.forEach((v) => {users.add(UserModel.fromJson(v))});
    return users;
  }
}
