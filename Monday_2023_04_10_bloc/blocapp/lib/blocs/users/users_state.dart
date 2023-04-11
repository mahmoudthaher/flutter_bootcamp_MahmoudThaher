import 'package:blocapp/models/user_model.dart';

abstract class UsersState {}

class InitialState extends UsersState {}

class SuccessState extends UsersState {
  List<UserModel> users;
  SuccessState({required this.users});
}

class FailureState extends UsersState {}

class LoadingState extends UsersState {}

// Get All success
// Error/Failure
// Loading