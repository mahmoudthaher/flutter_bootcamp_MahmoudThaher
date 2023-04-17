import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_exam/bloc/orders/orders_blocks.dart';
import 'package:flutter_exam/idprofile.dart';
import 'package:flutter_exam/login_page.dart';
import 'package:flutter_exam/myorders.dart';
import 'package:flutter_exam/product_page.dart';
import 'package:flutter_exam/profile_page.dart';
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
        //(context) => BlocProvider(
        // create: (context) => OrderBloc(), child: MyHomePage()),
        var routes = {
          "/": (context) => PreLoadPage(),
          "/myhomepage": (context) => MyHomePage(),
          "/order": (context) => MyOrdersPage(),
          "/login": (context) => LoginPage(),
          "/create": (context) => CreatePage(),
          "/edit": (context) => ProfilePage(),
          "/product": (context) => ProductsPage(),
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
    _checkLogin();
  }

  _checkLogin() async {
    storage = FlutterSecureStorage();
    var checker = await storage.containsKey(key: "token");
    if (checker) {
      Navigator.pushReplacementNamed(context, "/myhomepage");
    } else {
      Navigator.pushReplacementNamed(context, "/login");
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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: "Home",
              ),
              Tab(
                icon: Icon(Icons.shopify_outlined),
                text: "My Orders",
              ),
              Tab(
                icon: Icon(Icons.account_box_rounded),
                text: "Profile",
              ),
            ],
          ),
          actions: [
            ElevatedButton(
                onPressed: () async {
                  var storage = FlutterSecureStorage();
                  await storage.deleteAll();
                  Navigator.pushReplacementNamed(context, "/login");
                },
                child: Text("logout"))
          ],
        ),
        body: TabBarView(
          children: [
            ProductsPage(),
            MyOrdersPage(),
            ProfilePage(),
          ],
        ),
      ),
    );
  }
}

Container _widgetTab3() {
  return Container(
      child: Center(
    child: Text(
      "Button 3",
      style: TextStyle(fontSize: 30),
    ),
  ));
}

Container _widgetTab2() {
  return Container(
      child: Center(
    child: Text(
      "Button 2",
      style: TextStyle(fontSize: 30),
    ),
  ));
}

Container _widgetTab1() {
  return Container(
    child: Center(
      child: Text(
        "Button 1",
        style: TextStyle(fontSize: 30),
      ),
    ),
  );
}

class User {
  String email;
  String password;

  User({required this.email, required this.password, String? id});

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
