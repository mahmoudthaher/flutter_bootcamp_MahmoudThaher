import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:project/Providers/category_provider.dart';
import 'package:project/Providers/product_provider.dart';
import 'package:project/models/category_model.dart';
import 'package:project/models/product_model.dart';
import 'package:provider/provider.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<CategoryProvider>(context, listen: false);
    provider.getAllCategory();
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    productProvider.getAllProductsByCategoryID();
  }

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final category = categoryProvider.categories;
    final productProvider = Provider.of<ProductProvider>(context);
    final products = productProvider.products;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: SafeArea(
                child: SizedBox(
                  height: 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: category.length,
                    itemBuilder: (context, index) {
                      CategoryModel categories = category[index];
                      return Consumer(
                        builder:
                            (context, ProductProvider productProvider, child) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                productProvider.id = categories.id;
                                productProvider.getAllProductsByCategoryID();
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: productProvider.id ==
                                                    categories.id
                                                ? Colors.black
                                                : Colors.transparent,
                                            width: 2.0,
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        categories.category,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          color: productProvider.id ==
                                                  categories.id
                                              ? Colors.black
                                              : Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
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
