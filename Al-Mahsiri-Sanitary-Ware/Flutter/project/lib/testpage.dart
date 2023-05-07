import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:project/Providers/user_provider.dart';
import 'package:provider/provider.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Text(userProvider.user?.email ?? ""),
          Text(userProvider.user?.id ?? ""),
          Text(userProvider.user?.firstName ?? ""),
          ElevatedButton(
              onPressed: () async {
                FlutterSecureStorage storage = const FlutterSecureStorage();
                await storage.deleteAll();

                Navigator.pushReplacementNamed(
                  context,
                  "/loginPage",
                );
              },
              child: Text("logout")),
          ElevatedButton(
              onPressed: () async {
                Navigator.pushReplacementNamed(
                  context,
                  "/profilePage",
                );
              },
              child: Text("profile"))
        ],
      ),
    ));
  }
}
