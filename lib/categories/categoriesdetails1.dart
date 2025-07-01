import 'package:flutter/material.dart';
import 'package:waleem_1/categories/productdetails.dart';
import 'package:waleem_1/categories/productdetails3.dart';
import 'package:waleem_1/categories/productsdetails2.dart';

class Categoriesdetails1 extends StatelessWidget {
  Categoriesdetails1({super.key});
  List<Map<String, dynamic>> products = [
    {"name": "برجر حاشي", "price": "٥٠ ر.س", "image": "images/burger.png"},

    {
      "name": "قونص حاشي بلدي متبل",
      "price": "١٠٠ ر.س",
      "image": "images/_قوانص.jpg",
    },
    {"name": "كباب شوي حاشي", "price": "٥٠ ر.س", "image": "images/kebab.jpeg"},
    {
      "name": "كرات لحم حاشي",
      "price": "٨٠ ر.س",
      "image": "images/طريقة_كرات_اللحم.jpg",
    },
    {
      "name": "كرات لحم حاشي",
      "price": "٨٠ ر.س",
      "image": "images/طريقة_كرات_اللحم.jpg",
    },
    {
      "name": "كرات لحم حاشي",
      "price": "٨٠ ر.س",
      "image": "images/طريقة_كرات_اللحم.jpg",
    },
    {
      "name": "كرات لحم حاشي",
      "price": "٨٠ ر.س",
      "image": "images/طريقة_كرات_اللحم.jpg",
    },
    {
      "name": "كرات لحم حاشي",
      "price": "٨٠ ر.س",
      "image": "images/طريقة_كرات_اللحم.jpg",
    },
    {
      "name": "كرات لحم حاشي",
      "price": "٨٠ ر.س",
      "image": "images/طريقة_كرات_اللحم.jpg",
    },
    {
      "name": "كرات لحم حاشي",
      "price": "٨٠ ر.س",
      "image": "images/طريقة_كرات_اللحم.jpg",
    },
    {
      "name": "كرات لحم حاشي",
      "price": "٨٠ ر.س",
      "image": "images/طريقة_كرات_اللحم.jpg",
    },
    {
      "name": "كرات لحم حاشي",
      "price": "٨٠ ر.س",
      "image": "images/طريقة_كرات_اللحم.jpg",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(2),
            child: Container(color: Colors.red, height: 3),
          ),
          title: Text("مصنعات الحاشي"),

          actions: [],
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: GridView.builder(
            itemCount: products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) {
              final product = products[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductDetailsPage(product: product),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 4),
                    ],
                  ),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                            child: Image.asset(
                              product["image"]!,
                              height: 80,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 6,
                            left: 6,
                            child: Icon(
                              Icons.favorite_border,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          5,
                          (_) =>
                              Icon(Icons.star, color: Colors.amber, size: 16),
                        ),
                      ),
                      Text(
                        product["name"]!,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${product["price"]} ر.س",
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
