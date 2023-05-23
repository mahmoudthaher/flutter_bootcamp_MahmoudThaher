import 'package:flutter/material.dart';
import 'package:project/Providers/order_product_provider.dart';
import 'package:project/models/order_product_model.dart';
import 'package:provider/provider.dart';

class OrderDetailPage extends StatefulWidget {
  const OrderDetailPage({super.key});

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<OrderProductProvider>(context, listen: false);
    provider.getAllOrderdetail();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OrderProductProvider>(context);
    final orderProduct = provider.orderProducts;

    return Scaffold(
      appBar: AppBar(title: Text("تفاصيل الطلب")),
      body: ListView.builder(
        itemCount: orderProduct.length,
        itemBuilder: (context, index) {
          OrderProductModel orderProducts = orderProduct[index];
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
              height: 100,
              child: Card(
                child: ListTile(
                  leading: Image.network(
                    orderProducts.products.image,
                    width: 90,
                  ),
                  title: SizedBox(
                    height: 50,
                    child: Text(
                      orderProducts.products.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  subtitle: Text(
                      "السعر : ${orderProducts.products.price.toString()}"),
                  trailing: Text("العدد : ${orderProducts.qty}"),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
