// import 'package:flutter/material.dart';
// import 'package:waleem_1/cart.dart';
// import 'package:waleem_1/categories/maincategories.dart';
// import 'package:waleem_1/profile.dart';

// class MainNavigationPage extends StatefulWidget {
//   @override
//   _MainNavigationPageState createState() => _MainNavigationPageState();
// }

// class _MainNavigationPageState extends State<MainNavigationPage> {
//   int currentIndex = 0;

//   final List<Widget> pages = [maincategoriespage(), CartPage(), ProfilePage()];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: pages[currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: currentIndex,
//         selectedItemColor: Colors.red,
//         unselectedItemColor: Colors.grey,
//         onTap: (index) {
//           setState(() {
//             currentIndex = index;
//           });
//         },
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.category),
//             label: 'التصنيفات',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.shopping_cart),
//             label: 'السلة',
//           ),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'حسابي'),
//         ],
//       ),
//     );
//   }
// }
