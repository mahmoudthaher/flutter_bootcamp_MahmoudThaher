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

  ListView _productsListWidget(ProductProvider productProvider) {
    return ListView.builder(
      itemCount: productProvider.selectedProducts.length,
      itemBuilder: (context, index) {
        ProductModel product = productProvider.selectedProducts[index];
        return Card(
          elevation: 2,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            leading: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(product.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text(
              product.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              "المجموع : ${product.total.toStringAsFixed(2)}",
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
            trailing: Container(
              margin: EdgeInsets.only(top: 12),
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      try {
                        productProvider.updateQty(
                            product, product.selectedQty + 1);
                      } catch (ex) {
                        print(ex);
                      }
                    },
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    "${product.selectedQty}",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (product.selectedQty == 1) {
                        productProvider.removeProduct(index);
                        return;
                      }
                      productProvider.updateQty(
                          product, product.selectedQty - 1);
                    },
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color:
                            product.selectedQty == 1 ? Colors.red : Colors.blue,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Icon(
                        product.selectedQty == 1 ? Icons.delete : Icons.remove,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
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
