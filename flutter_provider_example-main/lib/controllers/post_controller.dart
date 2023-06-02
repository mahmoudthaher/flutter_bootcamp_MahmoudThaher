import 'package:provider_example/controllers/api_helper.dart';
import 'package:provider_example/models/product.dart';

class PostController {
  Future<List<Product>> getAll() async {
    var jsonObject = await ApiHelper().getRequest("products");
    List<Product> result = [];
    jsonObject.forEach((json) {
      result.add(Product.fromJson(json));
    });
    return result;
  }
}
