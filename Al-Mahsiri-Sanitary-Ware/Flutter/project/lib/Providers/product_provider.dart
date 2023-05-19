import 'package:flutter/material.dart';
import 'package:project/models/address_model.dart';
import 'package:project/models/category_model.dart';
import 'package:project/models/product_model.dart';
import 'package:project/controllers/product_controller.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> products = [];
  ProductModel? products2;

  //ProductModel? products2;
  int id = 1;
  CategoryModel? categories;
  List<ProductModel> selectedProducts = [];
  double total = 0;
  double taxAmount = 0;
  double subTotal = 0;
  AddressModel? address;
  final keyForm = GlobalKey<FormState>();
  int? paymentMethod;

  addToCart(ProductModel product) {
    selectedProducts.add(product);
    generateTotal();
    notifyListeners();
  }

  updateAddress(AddressModel newAddress) {
    address = newAddress;
  }

  updatePaymentMethod(int newId) {
    paymentMethod = newId;
    notifyListeners();
  }

  removeProduct(int index) {
    selectedProducts.removeAt(index);
    generateTotal();
    notifyListeners();
  }

  updateQty(ProductModel product, int newQty) {
    product.selectedQty = newQty;
    print("newQty" + newQty.toString());
    generateTotal();
    notifyListeners();
  }

  generateTotal() {
    total = 0;
    subTotal = 0;
    taxAmount = 0;
    for (ProductModel product in selectedProducts) {
      subTotal += product.subTotal;
      taxAmount += product.taxAmount;
      total += product.total;
    }
  }

  getAllProducts() async {
    ProductController().getProducts().then((result) {
      products = result;
      notifyListeners();
    }).catchError((ex) {
      print(ex);
    });
  }

  getAllProductsByCategoryID() async {
    ProductController().getProductByCategoryId(id).then((result) {
      products = result;
      notifyListeners();
    }).catchError((ex) {
      print(ex);
    });
  }
}
