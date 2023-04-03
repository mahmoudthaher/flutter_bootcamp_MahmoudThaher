import 'package:flutter/material.dart';
import 'package:project/deteilProduct.dart';
import 'package:project/fake_api_page.dart';
import 'package:project/forgotPassword.dart';
import 'package:project/loginpage.dart';
import 'package:project/product.dart';
import 'package:project/resetPassword.dart';
import 'package:project/verification.dart';

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
        initialRoute: "/fakeApi",
        onGenerateRoute: (settings) {
          var routes = {
            "/": (context) => const MyHomePage(title: ''),
            "/product": (context) => const ProductPage(),
            "/deteilProduct": (context) => const DeteilProductPage(),
            "/loginPage": (context) => const LoginPage(),
            "/resetPassword": (context) => const resetPasswordPage(),
            "/verification": (context) => const Verification(),
            "/fordotPassword": (context) => const ForgotPaswwordPage(),
            "/fakeApi": (context) => const FakeApiPage(),
          };
          WidgetBuilder builder = routes[settings.name]!;
          return MaterialPageRoute(builder: (ctx) => builder(ctx));
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
