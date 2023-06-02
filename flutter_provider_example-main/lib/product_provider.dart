import 'package:flutter/material.dart';
import 'package:provider_example/controllers/post_controller.dart';
import 'package:provider_example/models/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> products = [];
  // List<Product> products = [
  // Product(
  //     id: 1,
  //     name: "iPhone 9",
  //     description: "An apple mobile which is nothing like apple",
  //     image: "https://i.dummyjson.com/data/products/1/1.jpg"),
  // Product(
  //     id: 2,
  //     name: "iPhone X",
  //     description:
  //         "SIM-Free, Model A19211 6.5-inch Super Retina HD display with OLED technology A12 Bionic chip with ...",
  //     image: "https://i.dummyjson.com/data/products/2/1.jpg"),
  // Product(
  //     id: 3,
  //     name: "Samsung Universe 9",
  //     description:
  //         "Samsung's new variant which goes beyond Galaxy to the Universe",
  //     image: "https://i.dummyjson.com/data/products/3/1.jpg"),
  // Product(
  //   id: 4,
  //   name: "OPPOF19",
  //   description: "OPPO F19 is officially announced on April 2021.",
  //   image: "https://i.dummyjson.com/data/products/4/1.jpg",
  // )
  // ];

  addQty(Product product) {
    product.qty++;
    notifyListeners();
  }

  descreaseQty(Product product) {
    if (product.qty > 0) {
      product.qty--;
      notifyListeners();
    }
  }

  getAllPosts() async {
    PostController().getAll().then((result) {
      products = result;
      notifyListeners();
    }).catchError((ex) {
      print(ex);
    });
  }

  List<Product> get selectedProducts {
    return products.where((product) => product.qty > 0).toList();
    //اذا كانت الكمية صفر ما يعرضها
  }
}
