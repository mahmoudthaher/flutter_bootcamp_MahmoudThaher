import 'package:flutter/material.dart';
import 'package:project/Providers/product_provider.dart';
import 'package:provider/provider.dart';

class SummeryWidget extends StatelessWidget {
  const SummeryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ProductProvider productProvider, child) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "ملخص الفاتورة",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "عدد المنتجات",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                Text(
                  productProvider.selectedProducts.length.toString(),
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                )
              ],
            ),
            SizedBox(height: 5),
            Divider(),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "المجموع قبل الضريبة",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                Text(
                  productProvider.subTotal.toStringAsFixed(2),
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                )
              ],
            ),
            SizedBox(height: 5),
            Divider(),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "الضريبة 16%",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                Text(
                  productProvider.taxAmount.toStringAsFixed(2),
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                )
              ],
            ),
            SizedBox(height: 5),
            Divider(),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "المجموع",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                Text(
                  productProvider.total.toStringAsFixed(2),
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                )
              ],
            )
          ],
        ),
      );
    });
  }
}
