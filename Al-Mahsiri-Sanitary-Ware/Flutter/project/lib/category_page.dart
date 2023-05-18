import 'package:flutter/material.dart';
import 'package:project/Providers/product_provider.dart';
import 'package:project/controllers/category_controller.dart';
import 'package:project/controllers/product_controller.dart';
import 'package:project/design_product_page.dart';
import 'package:project/models/category_model.dart';
import 'package:project/models/product_model.dart';
import 'package:provider/provider.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  //bool _isPressed = false;

  //var categoryId = 1;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   final productsProvider =
  //       Provider.of<ProductProvider>(context, listen: false);
  //   setState(() {
  //     productsProvider.getAllProductsByCategoryID();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      // appBar: AppBar(actions: [
      //   SizedBox(
      //     width: 411,
      //     // height: 100,
      //     child: FutureBuilder(
      //       future: CategoryController().getAllCategories(),
      //       builder: (context, snapshot) {
      //         if (snapshot.connectionState == ConnectionState.waiting) {}
      //         if (snapshot.connectionState == ConnectionState.done) {
      //           return SafeArea(
      //             child: ListView.builder(
      //               scrollDirection: Axis.horizontal,
      //               itemCount: snapshot.data!.length,
      //               itemBuilder: (context, index) {
      //                 CategoryModel category = snapshot.data![index];
      //                 return Column(
      //                   children: [
      //                     InkWell(
      //                       onTap: () {
      //                         setState(
      //                           () {
      //                             categoryId = category.id;
      //                           },
      //                         );
      //                       },
      //                       child: SizedBox(
      //                         height: 60,
      //                         width: 100,
      //                         child: Container(
      //                             decoration: BoxDecoration(
      //                                 color: categoryId == category.id
      //                                     ? Colors.green
      //                                     : Colors.blue),
      //                             child:
      //                                 Center(child: Text(category.category))),
      //                       ),
      //                     ),
      //                   ],
      //                 );
      //               },
      //             ),
      //           );
      //         }
      //         return Container();
      //       },
      //     ),
      //   ),
      // ]),

      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 60,
              width: double.infinity,
              child: FutureBuilder(
                future: CategoryController().getAllCategories(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // return const Center(
                    //     child: SizedBox(
                    //         width: 80,
                    //         height: 80,
                    //         child: CircularProgressIndicator()));
                  }
                  if (snapshot.connectionState == ConnectionState.done) {
                    return SafeArea(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          CategoryModel category = snapshot.data![index];
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(
                                    () {
                                      productsProvider.id = category.id;
                                    },
                                  );
                                },
                                child: SizedBox(
                                  height: 60,
                                  width: 100,
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color:
                                              productsProvider.id == category.id
                                                  ? Colors.green.shade800
                                                  : Colors.green),
                                      child: Center(
                                          child: Text(category.category))),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ),
            Expanded(
              child: product(),
            )
          ],
        ),
      ),
    );
  }

  Container product() {
    final productsProvider = Provider.of<ProductProvider>(context);
    DesignProductsPage(
        future:
            ProductController().getProductByCategoryId(productsProvider.id));
    return Container();
  }

// return FutureBuilder(
  //   future: CategoryController().getAllCategories(),
  //   builder: (context, snapshot) {
  //     if (snapshot.connectionState == ConnectionState.waiting) {
  //       return const Center(
  //           child: SizedBox(
  //               width: 80, height: 80, child: CircularProgressIndicator()));
  //     }
  //     if (snapshot.connectionState == ConnectionState.done) {
  //       List<Tab> tabs = [];
  //       for (int i = 0; i < snapshot.data!.length; i++) {
  //         CategoryModel category = snapshot.data![i];
  //         tabs.add(Tab(
  //           icon: Icon(Icons.home),
  //           text: category.category,
  //         ));
  //       }
  //       return SafeArea(
  //         child: ListView.builder(
  //           scrollDirection: Axis.horizontal,
  //           itemCount: snapshot.data!.length,
  //           itemBuilder: (context, index) {
  //             CategoryModel category = snapshot.data![index];
  //             return DefaultTabController(
  //               length: snapshot.data!.length,
  //               child: Scaffold(
  //                 appBar: AppBar(
  //                   bottom: TabBar(isScrollable: true, tabs: tabs),
  //                 ),
  //               ),
  //             );
  //           },
  //         ),
  //       );
  //     }
  //     return Container();
  //   },
}
