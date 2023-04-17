import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/bloc/users/users_events.dart';
import 'package:flutter_exam/bloc/users/users_state.dart';

import '../../controllers/user_controller.dart';
import '../../models/user_model.dart';

class UsersBloc extends Bloc<UsersEvents, UsersState> {
  List<UserModel>? users;
  UsersBloc() : super(InitialState()) {
    // on onfire
    // emit emitter set
    on<GetUsersEvent>(_getUsers);
    on<RemoveUserEvent>(_removeUser);
    // on<IncreaseUserEvent>(_increatementCounter);
    // on<DecreaseUserEvent>(_decreatementCounter);
  }

  FutureOr<void> _getUsers(
      GetUsersEvent event, Emitter<UsersState> emit) async {
    try {
      emit(LoadingState());
      users = (await UserController().getUser()) as List<UserModel>?;
      print("Users Fetched");
      emit(SuccessState(users: users!));
    } catch (ex) {
      emit(FailureState());
    }
  }

  FutureOr<void> _removeUser(RemoveUserEvent event, Emitter<UsersState> emit) {
    users!.removeAt(event.index);
    emit(SuccessState(users: users!));
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
