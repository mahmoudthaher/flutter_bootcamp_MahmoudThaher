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
    on<RemoveProductEvent>(_removeUser);
    // on<IncreaseUserEvent>(_increatementCounter);
    // on<DecreaseUserEvent>(_decreatementCounter);
  }

  FutureOr<void> _getProducts(
      GetProductsEvent event, Emitter<ProductsState> emit) async {
    try {
      emit(LoadingState());
      print('before list');
      products = (await ProductController().getProducts());
      print("Products Fetched");
      emit(SuccessState(products: products!));
    } catch (ex) {
      print(ex);
      emit(FailureState());
    }
  }

  FutureOr<void> _removeUser(
      RemoveProductEvent event, Emitter<ProductsState> emit) {
    products!.removeAt(event.index);
    emit(SuccessState(products: products!));
  }

// FutureOr<void> _increatementCounter(
//     IncreaseUserEvent event, Emitter<UsersState> emit) {
//   UserModel user = users![event.index];
//   if (user.counter < 100) {
//     user.counter++;
//   }
//   emit(SuccessState(users: users!));
// }
//
// FutureOr<void> _decreatementCounter(
//     DecreaseUserEvent event, Emitter<UsersState> emit) {
//   UserModel user = users![event.index];
//   if (user.counter > 0) {
//     user.counter--;
//   }
//   emit(SuccessState(users: users!));
// }
}
