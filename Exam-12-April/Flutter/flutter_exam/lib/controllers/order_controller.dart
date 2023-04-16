import 'package:flutter_exam/controllers/api_helper.dart';
import 'package:flutter_exam/models/comment.dart';
import 'package:flutter_exam/models/order.dart';

class PostController {
  Future<List<Order>> getAllOrdersByAuth() async {
    try {
      dynamic jsonObject = await ApiHelper().getRequest("Orders");
      List<Order> result = [];
      jsonObject.forEach((json) {
        result.add(Order.fromJson(json));
      });
      return result;
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }
}
