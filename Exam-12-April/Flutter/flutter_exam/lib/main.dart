import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_exam/login_page.dart';
import 'package:flutter_exam/myorders.dart';
import 'package:flutter_exam/profile_page.dart';
import 'package:flutter_exam/taps.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'create_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      builder: EasyLoading.init(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/login",
      onGenerateRoute: (settings) {
        var routes = {
          "/": (context) => PreLoadPage(),
          "myhomepage": (context) => MyHomePage(),
          "/tabs": (context) => TabPage(),
          "/order": (context) => MyOrdersPage(),
          "/login": (context) => LoginPage(),
          "/create": (context) => CreatePage(),
          "/edit": (context) => ProfilePage(),
        };
        WidgetBuilder builder = routes[settings.name]!;
        return MaterialPageRoute(builder: (ctx) => builder(ctx));
      },
    );
  }
}

class PreLoadPage extends StatefulWidget {
  const PreLoadPage({super.key});

  @override
  State<PreLoadPage> createState() => _PreLoadPageState();
}

class _PreLoadPageState extends State<PreLoadPage> {
  @override
  void initState() {
    super.initState();
    //_checkLogin();
  }

  _checkLogin() async {
    var storage = FlutterSecureStorage();
    var checker = await storage.containsKey(key: "token");
    if (checker) {
      Navigator.pushReplacementNamed(context, "/myhomepage");
    } else {
      Navigator.pushReplacementNamed(context, "/tabs");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('widget.title'),
      ),
      body: Center(
        child: Text('hhhhhhhhhhh'),
      ),
    );
  }
}

class User {
  String email;
  String password;

  User({required this.email, required this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json["email"],
      password: json["password"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
    };
  }
}
