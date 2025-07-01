import 'package:flutter/material.dart';
import 'package:waleem_1/categories/categoriesdetails1.dart';
import 'package:waleem_1/categories/maincategories.dart';

import 'package:waleem_1/homepage.dart';

void main() {
  runApp(_MyApp());
}

class _MyApp extends StatefulWidget {
  const _MyApp({super.key});

  @override
  State<_MyApp> createState() => __MyAppState();
}

class __MyAppState extends State<_MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "waleem meat",
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        "categories": (context) => maincategoriespage(),
        "categoriesdetails": (context) => Categoriesdetails1(),
      },
    );
  }
}
