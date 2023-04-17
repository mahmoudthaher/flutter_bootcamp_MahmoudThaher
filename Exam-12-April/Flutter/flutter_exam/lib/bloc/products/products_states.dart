import 'package:flutter_exam/models/product_model.dart';

abstract class ProductsState {}

class InitialState extends ProductsState {}

class SuccessState extends ProductsState {
  List<ProductModel> products;
  SuccessState({required this.products});
}

class FailureState extends ProductsState {}

class LoadingState extends ProductsState {}

// Get All success
// Error/Failure
// Loading