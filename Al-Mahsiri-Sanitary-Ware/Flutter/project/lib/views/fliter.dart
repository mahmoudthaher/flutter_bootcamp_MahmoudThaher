import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:project/Providers/product_provider.dart';
import 'package:project/models/product_model.dart';
import 'package:provider/provider.dart';

class FliterPage extends StatefulWidget {
  final VoidCallback onBack;
  const FliterPage({required this.onBack, super.key});

  @override
  State<FliterPage> createState() => _FliterPageState();
}

class _FliterPageState extends State<FliterPage> {
  @override
  void initState() {
    super.initState();
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    productProvider.getAllProducts();
  }

  final fliterController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final products = productProvider.products;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextFormField(
              onChanged: (txt) {
                if (txt.isNotEmpty) {
                  setState(() {
                    productProvider.name = txt;
                    productProvider.filterProduct();
                  });
                } else {
                  setState(() {
                    productProvider.getAllProducts();
                  });
                }
              },

              keyboardType: TextInputType.name,
              style: const TextStyle(fontSize: 20, height: 2),
              //cursorColor: const Color(0xFF009688),
              cursorHeight: 40,
              cursorWidth: 2,
              decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(top: 13),
                  child: Wrap(
                    alignment: WrapAlignment.end,
                    children: [
                      const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      InkWell(
                        child: const Icon(Icons.cancel_outlined,
                            color: Colors.black),
                        onTap: () {
                          widget.onBack();
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
                hintText: 'بحث',
                hintStyle: const TextStyle(
                  fontSize: 20,
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(
              height: 1,
              width: double.infinity,
              child: Container(color: Colors.grey[300]),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: products.isEmpty
                  ? const Center(
                      child: SizedBox(
                      width: 80,
                      height: 80,
                      child: CircularProgressIndicator(),
                    ))
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.65,
                      ),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        ProductModel product = products[index];

                        return Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Card(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    side: BorderSide(color: Colors.black26)),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, top: 10, right: 10),
                                  child: Wrap(
                                    children: [
                                      Image.network(
                                        product.image,
                                        width: 200,
                                        height: 100,
                                      ),
                                      Row(
                                        children: const [
                                          SizedBox(
                                            height: 20,
                                          ),
                                        ],
                                      ),
                                      Container(
                                        height: 55,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          product.name,
                                          maxLines: 2,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18),
                                        ),
                                      ),
                                      Row(
                                        children: const [
                                          SizedBox(
                                            height: 50,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                                right: 10),
                                            child: Text(
                                              "${product.finalPrice.toStringAsFixed(2)} د.أ",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                          ),
                                          IconButton(
                                              style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    // borderRadius:
                                                    //     BorderRadius.circular(40),
                                                    ),
                                                backgroundColor: Colors.white,
                                              ),
                                              onPressed: () {
                                                productProvider
                                                    .addToCart(product);
                                                EasyLoading.dismiss();
                                                EasyLoading.showSuccess(
                                                    "تم الاضافة الى السلة");
                                              },
                                              icon: Icon(
                                                Icons.add_shopping_cart,
                                                size: 30,
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }
}
