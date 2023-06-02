import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/counter_provider.dart';
import 'package:provider_example/product_provider.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProductProvider>(context);
    var counterProvider = Provider.of<CounterProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Checkout ${counterProvider.counter}")),
      body: ListView.separated(
          itemBuilder: (context, index) => ListTile(
                leading: Image.network(
                  provider.selectedProducts[index].image,
                  width: 50,
                  height: 50,
                ),
                title: Text(provider.selectedProducts[index].title),
                subtitle: Text(provider.selectedProducts[index].description),
                trailing: Text("${provider.selectedProducts[index].qty}"),
              ),
          separatorBuilder: (context, index) => const Divider(),
          itemCount: provider.selectedProducts.length),
    );
  }
}
