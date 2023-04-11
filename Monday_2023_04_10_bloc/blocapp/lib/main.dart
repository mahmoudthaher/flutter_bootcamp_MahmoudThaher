import 'package:blocapp/blocs/users/users_bloc.dart';
import 'package:blocapp/blocs/users/users_events.dart';
import 'package:blocapp/blocs/users/users_state.dart';
import 'package:blocapp/controller/user_controller.dart';
import 'package:blocapp/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider(
          create: (context) => UsersBloc(),
          child: MyHomePage(title: 'Flutter Demo Home Page'),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<UsersBloc, UsersState>(
        builder: (context, state) {
          if (state is SuccessState) {
            return buildListView(context, state.users);
          }
          if (state is FailureState) {
            return const Center(child: Text("There are some errors"));
          }
          if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          return ElevatedButton(
              onPressed: () {
                context.read<UsersBloc>().add(GetUsersEvent());
              },
              child: const Text("Fetch Users"));
        },
      ),
    );
  }

  Widget buildListView(context, List<UserModel>? _users) {
    return ListView.builder(
      itemCount: _users!.length,
      itemBuilder: (context, index) {
        return ListTile(
          // onTap: () {
          //   context.read<UsersBloc>().add(RemoveUserEvent(index));
          // },
          title: Text(_users[index].name),
          subtitle: Row(
            children: [
              SizedBox(
                  width: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        context.read<UsersBloc>().add(IncreaseUserEvent(index));
                      },
                      child: Text("+"))),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Text("${_users[index].counter}"),
              ),
              SizedBox(
                  width: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        context.read<UsersBloc>().add(DecreaseUserEvent(index));
                      },
                      child: Text("-")))
            ],
          ),
          trailing: ElevatedButton(
              onPressed: () {
                context.read<UsersBloc>().add(RemoveUserEvent(index));
              },
              child: Text('Delete')),
        );
      },
    );
  }
}
