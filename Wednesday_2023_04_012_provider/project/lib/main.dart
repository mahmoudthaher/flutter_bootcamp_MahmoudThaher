import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/blocs/users/users_bloc.dart';
import 'package:project/blocs/users/users_events.dart';
import 'package:project/blocs/users/users_state.dart';
import 'package:project/models/user_model.dart';

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
        return Column(
          children: [
            Row(
              children: [
                Text("id : ${_users[index].id.toString()}"),
              ],
            ),
            Row(
              children: [
                Text("name : ${_users[index].name}"),
              ],
            ),
            Row(
              children: [
                Text("user name : ${_users[index].username}"),
              ],
            ),
            Row(
              children: [
                Text("email : ${_users[index].email}"),
              ],
            ),
            Row(
              children: [
                Text("phone : ${_users[index].phone}"),
              ],
            ),
            Row(
              children: [
                Text("website : ${_users[index].website}"),
              ],
            ),
            SizedBox(
              height: 15,
            )
          ],
        );
      },
    );
  }
}
