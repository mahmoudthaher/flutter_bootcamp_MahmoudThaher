import 'package:flutter_exam/controllers/api_helper.dart';
import 'package:flutter_exam/models/product_model.dart';

class ProductController {
  Future<List<ProductModel>> getProducts() async {
    try {
      dynamic jsonObject = await ApiHelper().getRequest("api/Products");
      List<ProductModel> products = [];
      jsonObject.forEach((v) => {products.add(ProductModel.fromJson(v))});
      return products;
    } catch (ex) {
      rethrow;
    }
  }
}
