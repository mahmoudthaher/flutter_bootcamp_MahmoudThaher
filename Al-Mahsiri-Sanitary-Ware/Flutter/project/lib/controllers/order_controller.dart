import 'package:project/controllers/api_helper.dart';
import 'package:project/models/order.dart';

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
}
