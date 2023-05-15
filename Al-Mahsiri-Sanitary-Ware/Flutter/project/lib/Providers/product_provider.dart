import 'package:flutter/material.dart';
import 'package:project/models/product_model.dart';
import 'package:project/controllers/product_controller.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> products = [];

  getAllProducts() async {
    ProductController().getProducts().then((result) {
      products = result;
      notifyListeners();
    }).catchError((ex) {
      print(ex);
    });
  }
}
