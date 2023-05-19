import 'package:flutter/material.dart';
import 'package:project/Providers/product_provider.dart';
import 'package:provider/provider.dart';

class SummeryWidget extends StatelessWidget {
  const SummeryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ProductProvider productProvier, child) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "ملخص الفاتورة",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 3),
            const Divider(),
            const SizedBox(height: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "عدد المنتجات",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                Text(
                  productProvier.selectedProducts.length.toString(),
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                )
              ],
            ),
            const SizedBox(height: 3),
            const Divider(),
            const SizedBox(height: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "المجموع قبل الضريبة",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                Text(
                  productProvier.subTotal.toStringAsFixed(2),
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                )
              ],
            ),
            const SizedBox(height: 3),
            const Divider(),
            const SizedBox(height: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "الضريبة 16%",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                Text(
                  productProvier.taxAmount.toStringAsFixed(2),
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                )
              ],
            ),
            const SizedBox(height: 3),
            const Divider(),
            const SizedBox(height: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "المجموع الكامل",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                Text(
                  productProvier.total.toStringAsFixed(2),
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                )
              ],
            )
          ],
        ),
      );
    });
  }
}
