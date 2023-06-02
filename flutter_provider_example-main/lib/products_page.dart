import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/checkout_page.dart';
import 'package:provider_example/controllers/post_controller.dart';
import 'package:provider_example/models/product.dart';
import 'package:provider_example/product_provider.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  void initState() {
    super.initState();
    var provider = Provider.of<ProductProvider>(context, listen: false);
    provider.getAllPosts();
  }

  @override
  Widget build(BuildContext context) {
    // Provider(create: (context) {
    //   return Model(Provider.of<ProductProvider>(context, listen: false));
    // });
    var provider = Provider.of<ProductProvider>(context);
    List<Product> products = provider.products;

    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => ListTile(
                      // onTap: () {},
                      leading: Image.network(
                        products[index].image,
                        width: 50,
                        height: 50,
                      ),
                      title: Text(products[index].title),
                      subtitle: Text(products[index].description),
                      trailing: SizedBox(
                        height: 60,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                                onTap: () {
                                  provider.addQty(products[index]);
                                },
                                child: const Text("+")),
                            Text("${products[index].qty}"),
                            InkWell(
                                onTap: () {
                                  provider.descreaseQty(products[index]);
                                },
                                child: const Text("-")),
                          ],
                        ),
                      ),
                    ),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: products.length),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CheckoutPage(),
                    ));
              },
              child: const Text("Checkout"))
        ],
      ),
    );
  }
}
