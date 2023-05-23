import 'package:project/controllers/api_helper.dart';
import 'package:project/models/product_model.dart';

class ProductController {
  Future<List<ProductModel>> getProducts() async {
    try {
      dynamic jsonObject = await ApiHelper().getRequest2("api/Products");
      List<ProductModel> products = [];
      jsonObject["data"]
          .forEach((v) => {products.add(ProductModel.fromJson(v))});
      return products;
    } catch (ex) {
      rethrow;
    }
  }

  Future<List<ProductModel>> getProductByCategoryId(int categoryId) async {
    try {
      dynamic jsonObject =
          await ApiHelper().getRequest2("api/Products/$categoryId");
      List<ProductModel> products = [];
      jsonObject.forEach((v) => {products.add(ProductModel.fromJson(v))});
      return products;
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }

  Future<List<ProductModel>> fliterProduct(String name) async {
    try {
      dynamic jsonObject =
          await ApiHelper().getRequest2("api/Products/fliterProduct/$name");
      List<ProductModel> products = [];
      jsonObject.forEach((v) => {products.add(ProductModel.fromJson(v))});
      return products;
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }
}
