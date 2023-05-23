import 'package:project/controllers/api_helper.dart';
import 'package:project/models/order.dart';
import 'package:project/models/order_mpdel.dart';

class OrderController {
  Future<dynamic> create(Order order) async {
    try {
      var result = await ApiHelper().postDio("/api/Orders", order.toJson());
      print(result);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<OrderModel>> getAllOrders(String userId) async {
    try {
      dynamic jsonObject = await ApiHelper().getRequest2("api/Orders/$userId");
      List<OrderModel> orders = [];
      jsonObject.forEach((v) => {orders.add(OrderModel.fromJson(v))});
      return orders;
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }
}
