import 'package:flutter_exam/models/product_model.dart';

import 'api_helper.dart';

class ProductController {
  Future<List<ProductModel>?> getProducts() async {
    try {
      dynamic jsonObject = await ApiHelper().getRequest("api/products");
      List<ProductModel> products = [];
      jsonObject.forEach((v) => {products.add(ProductModel.fromJson(v))});
      return products;
    } catch (ex) {
      rethrow;
    }
  }
}
