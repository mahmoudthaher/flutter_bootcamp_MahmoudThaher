import 'dart:async';

import 'package:project/blocs/users/users_events.dart';
import 'package:project/blocs/users/users_state.dart';
import 'package:project/controller/user_controller.dart';
import 'package:project/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersBloc extends Bloc<UsersEvents, UsersState> {
  List<UserModel>? users;
  UsersBloc() : super(InitialState()) {
    // on onfire
    // emit emitter set
    on<GetUsersEvent>(_getUsers);
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
}
