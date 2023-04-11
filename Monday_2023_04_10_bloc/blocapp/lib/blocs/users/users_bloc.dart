import 'dart:async';

import 'package:blocapp/blocs/users/users_events.dart';
import 'package:blocapp/blocs/users/users_state.dart';
import 'package:blocapp/controller/user_controller.dart';
import 'package:blocapp/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersBloc extends Bloc<UsersEvents, UsersState> {
  List<UserModel>? users;
  UsersBloc() : super(InitialState()) {
    // on onfire
    // emit emitter set
    on<GetUsersEvent>(_getUsers);
    on<RemoveUserEvent>(_removeUser);
    on<IncreaseUserEvent>(_increatementCounter);
    on<DecreaseUserEvent>(_decreatementCounter);
  }

  FutureOr<void> _getUsers(
      GetUsersEvent event, Emitter<UsersState> emit) async {
    try {
      emit(LoadingState());
      users = await UserController().getUser();
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

  FutureOr<void> _increatementCounter(
      IncreaseUserEvent event, Emitter<UsersState> emit) {
    UserModel user = users![event.index];
    if (user.counter < 100) {
      user.counter++;
    }
    emit(SuccessState(users: users!));
  }

  FutureOr<void> _decreatementCounter(
      DecreaseUserEvent event, Emitter<UsersState> emit) {
    UserModel user = users![event.index];
    if (user.counter > 0) {
      user.counter--;
    }
    emit(SuccessState(users: users!));
  }
}
