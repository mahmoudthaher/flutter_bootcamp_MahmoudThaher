import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geolocator/geolocator.dart';
import 'package:project/Providers/product_provider.dart';
import 'package:project/controllers/location_controller.dart';
import 'package:project/models/product_model.dart';
import 'package:project/views/order_checkout_page.dart';
import 'package:project/views/summery_widget.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
        // leading: InkWell(
        //     child: Icon(
        //       Icons.arrow_back_outlined,
        //     ),
        //     onTap: () {
        //       Navigator.pushReplacementNamed(context, "/bottomnavigation");
        //     }),
      ),
      body: Consumer(
        builder: (context, ProductProvider productProvider, child) {
          if (productProvider.selectedProducts.isEmpty) {
            return Center(child: Text("Your cart is empty"));
          }
          return Column(
            children: [
              Expanded(
                flex: 5,
                child: _productsListWidget(productProvider),
              ),
              SummeryWidget(),
              _buttonCheckoutWidget(context)
            ],
          );
        },
      ),
    );
  }

  SizedBox _buttonCheckoutWidget(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              onPressed: () {
                _handleBeginCheckoutAction(context);
              },
              child: Text("Begin Checkout")),
        ));
  }

  ListView _productsListWidget(ProductProvider productProvier) {
    return ListView.builder(
      itemCount: productProvier.selectedProducts.length,
      itemBuilder: (context, index) {
        ProductModel product = productProvier.selectedProducts[index];
        return Dismissible(
          key: Key(index.toString()),
          background: Container(
            color: Colors.red,
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Icon(
                Icons.delete,
                color: Colors.white,
              )
            ]),
          ),
          onDismissed: (direction) {
            productProvier.removeProduct(index);
          },
          child: SizedBox(
            height: 150,
            child: ListTile(
              leading: Image.network(
                product.image,
                width: 90,
              ),
              title: Text(product.name),
              subtitle: Text("المجموع : ${product.total.toStringAsFixed(2)}"),
              trailing: Container(
                width: 155,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          try {
                            productProvier.updateQty(
                                product, product.selectedQty + 1);
                          } catch (ex) {
                            print(ex);
                          }
                        },
                        child: Text("+")),
                    Text("${product.selectedQty}"),
                    TextButton(
                      onPressed: () {
                        if (product.selectedQty == 1) {
                          productProvier.removeProduct(index);
                          return;
                        }
                        productProvier.updateQty(
                            product, product.selectedQty - 1);
                      },
                      child: product.selectedQty == 1
                          ? Icon(Icons.delete)
                          : Text("-"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  _handleBeginCheckoutAction(BuildContext context) async {
    bool exists = await FlutterSecureStorage().containsKey(key: "token");

    if (exists) {
      // ignore: use_build_context_synchronously
      _handleGoToOrderCheckout(context);
    } else {
      var result = await Navigator.pushNamed(context, "/loginPage");

      if (result != null) {
        _handleGoToOrderCheckout(context);
      }
    }
  }

  _handleGoToOrderCheckout(BuildContext context) async {
    try {
      EasyLoading.show(status: "Fetching location");
      Position location = await LocationController().determinePosition();

      EasyLoading.dismiss();
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => OrderCheckoutPage(location)));
    } catch (ex) {
      EasyLoading.dismiss();
      EasyLoading.showError(ex.toString());
    }
  }
}
