import 'package:flutter_exam/controllers/api_helper.dart';
import 'package:flutter_exam/models/order_model.dart';

class OrderController {
  Future<List<OrderModel>> getAllOrdersByAuth() async {
    dynamic jsonObject = await ApiHelper().getRequest("api/Orders");
    List<OrderModel> orders = [];
    jsonObject.forEach((json) {
      orders.add(OrderModel.fromJson(json));
    });
    return orders;
  }
}
