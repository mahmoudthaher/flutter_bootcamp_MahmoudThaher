import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/bloc/products/products_events.dart';
import 'package:flutter_exam/bloc/products/products_states.dart';

import '../../controllers/product_controller.dart';
import '../../models/product_model.dart';

class ProductsBloc extends Bloc<ProductEvents, ProductsState> {
  List<ProductModel>? products;
  ProductsBloc() : super(InitialState()) {
    // on onfire
    // emit emitter set
    on<GetProductsEvent>(_getProducts);
    on<IncreaseProductEvent>(_increatementCounter);
    on<DecreaseProductEvent>(_decreatementCounter);
  }

  FutureOr<void> _getProducts(
      GetProductsEvent event, Emitter<ProductsState> emit) async {
    try {
      emit(LoadingState());
      products = (await ProductController().getProducts());
      emit(SuccessState(products: products!));
    } catch (ex) {
      emit(FailureState());
    }
  }

  FutureOr<void> _increatementCounter(
      IncreaseProductEvent event, Emitter<ProductsState> emit) {
    ProductModel product = products![event.index];
    if (product.counter < 100) {
      product.counter++;
    }
    emit(SuccessState(products: products!));
  }

  FutureOr<void> _decreatementCounter(
      DecreaseProductEvent event, Emitter<ProductsState> emit) {
    ProductModel product = products![event.index];
    if (product.counter > 0) {
      product.counter--;
    }
    emit(SuccessState(products: products!));
  }
}
