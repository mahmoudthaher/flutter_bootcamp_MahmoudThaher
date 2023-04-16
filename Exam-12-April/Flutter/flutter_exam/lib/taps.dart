import 'package:flutter/material.dart';
import 'package:flutter_exam/myorders.dart';
import 'package:flutter_exam/tape2.dart';

class TabPage extends StatefulWidget {
  const TabPage({super.key});

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
              bottom: const TabBar(isScrollable: true, tabs: [
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
          ])),
          body: TabBarView(
            children: [
              Tab1Page(),
              MyOrdersPage(),
              _widgetTab3(),
            ],
          )),
    );
  }
}

// DefaultTabController.
// TabBar
// TabBarView

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
