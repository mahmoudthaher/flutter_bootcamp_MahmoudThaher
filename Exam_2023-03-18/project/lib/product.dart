import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Wrap(
              children: [
                Wrap(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          const Expanded(
                            flex: 3,
                            child: SizedBox(
                              height: 80,
                            ),
                          ),
                          const Expanded(
                            flex: 3,
                            child: Text(
                              'Kategori',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          Expanded(
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.shopping_cart_outlined),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 0.3,
                      child: Container(color: Colors.grey),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                      child: Text(
                        'Makanan',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        decoration: InputDecoration(
                          suffixIcon: const Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 30,
                          ),
                          hintText: '   Search Products Name',
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 250,
                ),
                Container(
                  color: Colors.grey[100],
                  child: Wrap(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 12, top: 20, bottom: 12),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, "/deteilProduct");
                                },
                                child: Card(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Container(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(right: 15),
                                          child: const Image(
                                            image: AssetImage(
                                                'assets/images/product.png'),
                                            width: 150,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(right: 70),
                                          child: const Text(
                                            'Keripik Pisang',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(right: 90),
                                          child: Text(
                                            'Rp. 30.000',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.red[500],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              TextButton.icon(
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons.star,
                                                  size: 15,
                                                  color: Colors.yellow[800],
                                                ),
                                                label: Text(
                                                  '4.6',
                                                  style: TextStyle(
                                                      color: Colors.grey[700]),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {},
                                                child: Text(
                                                  '86 Reviews  ',
                                                  style: TextStyle(
                                                    color: Colors.grey[700],
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                child: Icon(Icons.more_vert,
                                                    color: Colors.grey[600]),
                                                onTap: () {},
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 12, top: 20, bottom: 12),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, "/deteilProduct");
                                },
                                child: Card(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Container(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(right: 15),
                                          child: const Image(
                                            image: AssetImage(
                                                'assets/images/product.png'),
                                            width: 150,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(right: 70),
                                          child: const Text(
                                            'Keripik Pisang',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(right: 90),
                                          child: Text(
                                            'Rp. 30.000',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.red[500],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              TextButton.icon(
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons.star,
                                                  size: 15,
                                                  color: Colors.yellow[800],
                                                ),
                                                label: Text(
                                                  '4.6',
                                                  style: TextStyle(
                                                      color: Colors.grey[700]),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {},
                                                child: Text(
                                                  '86 Reviews  ',
                                                  style: TextStyle(
                                                    color: Colors.grey[700],
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                child: Icon(Icons.more_vert,
                                                    color: Colors.grey[600]),
                                                onTap: () {},
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 12, bottom: 12),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, "/deteilProduct");
                                },
                                child: Card(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Container(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(right: 15),
                                          child: const Image(
                                            image: AssetImage(
                                                'assets/images/product.png'),
                                            width: 150,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(right: 70),
                                          child: const Text(
                                            'Keripik Pisang',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(right: 90),
                                          child: Text(
                                            'Rp. 30.000',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.red[500],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              TextButton.icon(
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons.star,
                                                  size: 15,
                                                  color: Colors.yellow[800],
                                                ),
                                                label: Text(
                                                  '4.6',
                                                  style: TextStyle(
                                                      color: Colors.grey[700]),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {},
                                                child: Text(
                                                  '86 Reviews  ',
                                                  style: TextStyle(
                                                    color: Colors.grey[700],
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                child: Icon(Icons.more_vert,
                                                    color: Colors.grey[600]),
                                                onTap: () {},
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 12, bottom: 12),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, "/deteilProduct");
                                },
                                child: Card(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Container(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(right: 15),
                                          child: const Image(
                                            image: AssetImage(
                                                'assets/images/product.png'),
                                            width: 150,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(right: 70),
                                          child: const Text(
                                            'Keripik Pisang',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(right: 90),
                                          child: Text(
                                            'Rp. 30.000',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.red[500],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              TextButton.icon(
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons.star,
                                                  size: 15,
                                                  color: Colors.yellow[800],
                                                ),
                                                label: Text(
                                                  '4.6',
                                                  style: TextStyle(
                                                      color: Colors.grey[700]),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {},
                                                child: Text(
                                                  '86 Reviews  ',
                                                  style: TextStyle(
                                                    color: Colors.grey[700],
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                child: Icon(Icons.more_vert,
                                                    color: Colors.grey[600]),
                                                onTap: () {},
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 12, bottom: 12),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, "/deteilProduct");
                                },
                                child: Card(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Container(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(right: 15),
                                          child: const Image(
                                            image: AssetImage(
                                                'assets/images/product.png'),
                                            width: 150,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(right: 70),
                                          child: const Text(
                                            'Keripik Pisang',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(right: 90),
                                          child: Text(
                                            'Rp. 30.000',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.red[500],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              TextButton.icon(
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons.star,
                                                  size: 15,
                                                  color: Colors.yellow[800],
                                                ),
                                                label: Text(
                                                  '4.6',
                                                  style: TextStyle(
                                                      color: Colors.grey[700]),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {},
                                                child: Text(
                                                  '86 Reviews  ',
                                                  style: TextStyle(
                                                    color: Colors.grey[700],
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                child: Icon(Icons.more_vert,
                                                    color: Colors.grey[600]),
                                                onTap: () {},
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 12, bottom: 12),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, "/deteilProduct");
                                },
                                child: Card(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Container(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(right: 15),
                                          child: const Image(
                                            image: AssetImage(
                                                'assets/images/product.png'),
                                            width: 150,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(right: 70),
                                          child: const Text(
                                            'Keripik Pisang',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(right: 90),
                                          child: Text(
                                            'Rp. 30.000',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.red[500],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              TextButton.icon(
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons.star,
                                                  size: 15,
                                                  color: Colors.yellow[800],
                                                ),
                                                label: Text(
                                                  '4.6',
                                                  style: TextStyle(
                                                      color: Colors.grey[700]),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {},
                                                child: Text(
                                                  '86 Reviews  ',
                                                  style: TextStyle(
                                                    color: Colors.grey[700],
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                child: Icon(Icons.more_vert,
                                                    color: Colors.grey[600]),
                                                onTap: () {},
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.grey[100],
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: const BorderSide(
                            color: Colors.black,
                          ),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Filter & Sorting',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
