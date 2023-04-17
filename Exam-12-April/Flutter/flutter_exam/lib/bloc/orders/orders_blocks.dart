import 'dart:async';

import 'package:flutter_exam/bloc/orders/orders_events.dart';
import 'package:flutter_exam/bloc/orders/orders_states.dart';
import 'package:flutter_exam/models/order_model.dart';
import 'package:flutter_exam/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controllers/order_controller.dart';

class OrderBloc extends Bloc<OrderEvents, OrdersState> {
  int? id;
  List<OrderModel>? orders;
  OrderBloc() : super(InitialState()) {
    // on onfire
    // emit emitter set
    on<GetOrdersEvent>(_getUsers);
  }

  FutureOr<void> _getUsers(
      GetOrdersEvent event, Emitter<OrdersState> emit) async {
    // try {
    //   emit(LoadingState());
    //   orders = await OrderController().getById(id!);
    //   print("Users Fetched");
    //   emit(SuccessState(orders: orders!));
    // } catch (ex) {
    //   emit(FailureState());
    // }
  }
}
