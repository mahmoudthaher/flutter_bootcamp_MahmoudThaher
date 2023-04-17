import '../../models/order_model.dart';

abstract class OrdersState {}

class InitialState extends OrdersState {}

class SuccessState extends OrdersState {
  List<OrderModel> orders;
  SuccessState({required this.orders});
}

class FailureState extends OrdersState {}

class LoadingState extends OrdersState {}

// Get All success
// Error/Failure
// Loading