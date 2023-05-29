import 'package:flutter/material.dart';
import 'package:project/controllers/category_controller.dart';
import 'package:project/models/category_model.dart';

class CategoryProvider with ChangeNotifier {
  List<CategoryModel> categories = [];
  String name = "";
  getAllCategory() async {
    CategoryController().getAllCategories().then((result) {
      categories = result;
      notifyListeners();
    }).catchError((ex) {});
  }
}
