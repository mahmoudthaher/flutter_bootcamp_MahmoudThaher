import 'package:flutter/material.dart';
import 'package:project/controllers/category_controller.dart';
import 'package:project/controllers/city_controller.dart';
import 'package:project/models/category_model.dart';
import 'package:project/models/city_model.dart';

class CategoryProvider with ChangeNotifier {
  List<CategoryModel> categories = [];

  getAllCities() async {
    CategoryController().getAllCategories().then((result) {
      categories = result;
      notifyListeners();
    }).catchError((ex) {});
  }
}
