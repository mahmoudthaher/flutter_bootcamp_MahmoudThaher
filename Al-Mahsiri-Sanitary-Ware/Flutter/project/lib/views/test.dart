import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your E-commerce App',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
        // Add any additional app bar customization as needed
      ),
      body: ListView(
        children: [
          BannerSection(),
          SizedBox(height: 20),
          CategorySection(
            category: 'Category 1',
            products: [
              ProductCard(
                image: 'assets/images/product1.jpg',
                name: 'Product 1',
                price: '\$29.99',
              ),
              ProductCard(
                image: 'assets/images/product2.jpg',
                name: 'Product 2',
                price: '\$39.99',
              ),
              ProductCard(
                image: 'assets/images/product3.jpg',
                name: 'Product 3',
                price: '\$19.99',
              ),
            ],
          ),
          SizedBox(height: 20),
          CategorySection(
            category: 'Category 2',
            products: [
              ProductCard(
                image: 'assets/images/product4.jpg',
                name: 'Product 4',
                price: '\$49.99',
              ),
              ProductCard(
                image: 'assets/images/product5.jpg',
                name: 'Product 5',
                price: '\$59.99',
              ),
              ProductCard(
                image: 'assets/images/product6.jpg',
                name: 'Product 6',
                price: '\$69.99',
              ),
            ],
          ),
          SizedBox(height: 20),
          CategorySection(
            category: 'Category 3',
            products: [
              ProductCard(
                image: 'assets/images/product7.jpg',
                name: 'Product 7',
                price: '\$79.99',
              ),
              ProductCard(
                image: 'assets/images/product8.jpg',
                name: 'Product 8',
                price: '\$89.99',
              ),
              ProductCard(
                image: 'assets/images/product9.jpg',
                name: 'Product 9',
                price: '\$99.99',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BannerSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.blue,
      child: Center(
        child: Text(
          'Welcome to Our Store!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class CategorySection extends StatelessWidget {
  final String category;
  final List<ProductCard> products;

  const CategorySection({
    required this.category,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            category,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 240,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                return products[index];
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String image;
  final String name;
  final String price;

  const ProductCard({
    required this.image,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MainPage(),
  ));
}
