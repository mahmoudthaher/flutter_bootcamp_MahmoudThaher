import 'package:project/controllers/api_helper.dart';
import 'package:project/models/category_model.dart';

class CategoryController {
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      dynamic jsonObject = await ApiHelper().getRequest2("api/Categories");
      List<CategoryModel> category = [];
      jsonObject["data"]
          .forEach((v) => {category.add(CategoryModel.fromJson(v))});
      return category;
    } catch (ex) {
      rethrow;
    }
  }
}
