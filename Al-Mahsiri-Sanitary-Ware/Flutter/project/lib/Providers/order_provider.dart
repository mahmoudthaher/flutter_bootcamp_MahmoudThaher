import 'package:flutter/material.dart';
import 'package:project/controllers/order_controller.dart';
import 'package:project/models/order_mpdel.dart';

class OrderProvider with ChangeNotifier {
  List<OrderModel> orders = [];
  String? userId;

  getAllOrders() async {
    OrderController().getAllOrders(userId!).then((result) {
      orders = result;
      notifyListeners();
    }).catchError((ex) {});
  }
}
