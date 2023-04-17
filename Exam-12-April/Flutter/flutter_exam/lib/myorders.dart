import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_exam/bloc/orders/orders_blocks.dart';
import 'package:flutter_exam/bloc/orders/orders_states.dart';
import 'package:flutter_exam/models/order_model.dart';
import 'bloc/orders/orders_events.dart';
import 'controllers/order_controller.dart';

class MyOrdersPage extends StatefulWidget {
  const MyOrdersPage({super.key});

  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {
  List<OrderModel> orders = [];
  @override
  void initState() {
    super.initState();
    _getOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {},
          title: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Date : ${orders[index].createdAt.toString()}",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "ID : ${orders[index].id.toString()}",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "total : ${orders[index].total.toString()}",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              )
            ],
          ),
        );
      },
    )));
  }

  _getOrders() {
    OrderController().getAllOrdersByAuth().then((value) {
      setState(() {
        orders = value;
      });
    }).catchError((ex) {
      EasyLoading.dismiss();
      EasyLoading.showError(ex.toString());
    });
  }
}
