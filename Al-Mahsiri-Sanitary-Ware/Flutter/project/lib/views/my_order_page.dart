import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:project/Providers/order_product_provider.dart';
import 'package:project/Providers/order_provider.dart';
import 'package:project/models/order_mpdel.dart';
import 'package:provider/provider.dart';

class MyOrederPage extends StatefulWidget {
  const MyOrederPage({super.key});

  @override
  State<MyOrederPage> createState() => _MyOrederPageState();
}

class _MyOrederPageState extends State<MyOrederPage> {
  final storage = FlutterSecureStorage();
  String? idUser;
  @override
  void initState() {
    super.initState();
    _UserId();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OrderProvider>(context);
    final orderProvider = Provider.of<OrderProductProvider>(context);

    final orders = provider.orders;

    return Scaffold(
      body: Container(
          child: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          OrderModel order = orders[index];

          return Dismissible(
            key: Key(index.toString()),
            background: Container(
              color: Colors.red,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Icon(
                      Icons.delete,
                      color: Colors.white,
                    )
                  ]),
            ),
            child: SizedBox(
              height: 80,
              child: InkWell(
                child: Card(
                  child: ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Text(order.createdAt!.substring(0, 10)),
                          Text(order.createdAt!.substring(11, 19)),
                        ],
                      ),
                    ),
                    title: Text(
                      "المجموع : ${order.total.toStringAsFixed(2)}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      "المجموع بدون الضريبة : ${order.subTotal.toStringAsFixed(2)}",
                      style: TextStyle(fontSize: 13),
                    ),
                    trailing: Text("الحالة : ${order.status.status}"),
                  ),
                ),
                onTap: () {
                  setState(() {
                    orderProvider.orderId = order.id;
                  });
                  Navigator.pushNamed(context, "/orderdetail");
                },
              ),
            ),
          );
        },
      )),
    );
  }

  Future<void> _UserId() async {
    String? idUser = await storage.read(key: 'id');
    final provider = Provider.of<OrderProvider>(context, listen: false);
    provider.userId = idUser;
    provider.getAllOrders();
  }
}
