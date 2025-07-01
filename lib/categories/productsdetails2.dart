// import 'package:flutter/material.dart';

// class ProductDetailsPage2 extends StatefulWidget {
//   final Map<String, dynamic> product;

//   const ProductDetailsPage2({super.key, required this.product});

//   @override
//   State<ProductDetailsPage2> createState() => _ProductDetailsPage2State();
// }

// class _ProductDetailsPage2State extends State<ProductDetailsPage2>
//     with SingleTickerProviderStateMixin {
//   int quantity = 1;
//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 3, vsync: this);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final product = widget.product;
//     double price =
//         double.tryParse(product['price'].replaceAll(RegExp(r'[^\d.]'), '')) ??
//         0;

//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         appBar: AppBar(title: Text(product["name"])),
//         body: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // ✅ الصورة الكبيرة
//               Image.asset(
//                 product["image"],
//                 width: double.infinity,
//                 height: 250,
//                 fit: BoxFit.cover,
//               ),

//               SizedBox(height: 10),

//               // ✅ الصورة المصغرة
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(8),
//                   child: Image.asset(
//                     product["image"],
//                     width: 100,
//                     height: 60,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),

//               // ✅ العنوان + السعر
//               Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: Text(
//                   "${product["name"]} - قونص حاشي بلدي - ${product["price"]}",
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//               ),

//               // ✅ التقييم
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: Row(
//                   children: [
//                     ...List.generate(
//                       5,
//                       (index) =>
//                           Icon(Icons.star, color: Colors.white, size: 20),
//                     ),
//                     SizedBox(width: 8),
//                     Text("(0.0)", style: TextStyle(color: Colors.grey)),
//                     SizedBox(width: 8),
//                     Text("5 مراجعات", style: TextStyle(color: Colors.grey)),
//                   ],
//                 ),
//               ),

//               // ✅ Tabs
//               TabBar(
//                 controller: _tabController,
//                 labelColor: Colors.red,
//                 unselectedLabelColor: Colors.grey,
//                 tabs: const [
//                   Tab(text: "تفاصيل"),
//                   Tab(text: "فيديوهات"),
//                   Tab(text: "تعليقات"),
//                 ],
//               ),

//               Container(
//                 height: 120,
//                 padding: EdgeInsets.all(16),
//                 child: TabBarView(
//                   controller: _tabController,
//                   children: [
//                     TextField(
//                       maxLines: 4,
//                       decoration: InputDecoration(
//                         hintText: "تفاصيل المنتج",
//                         border: OutlineInputBorder(),
//                       ),
//                     ),
//                     Center(child: Text("لا توجد فيديوهات حالياً")),
//                     Center(child: Text("لا توجد تعليقات بعد")),
//                   ],
//                 ),
//               ),

//               // ✅ اختيار الكمية
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: Row(
//                   children: [
//                     IconButton(
//                       icon: Icon(Icons.remove_circle),
//                       onPressed: () {
//                         if (quantity > 1) {
//                           setState(() => quantity--);
//                         }
//                       },
//                     ),
//                     Text('$quantity', style: TextStyle(fontSize: 18)),
//                     IconButton(
//                       icon: Icon(Icons.add_circle),
//                       onPressed: () {
//                         setState(() => quantity++);
//                       },
//                     ),
//                     Spacer(),
//                     Text(
//                       "${(quantity * price).toStringAsFixed(0)} ر.س",
//                       style: TextStyle(fontSize: 18, color: Colors.red),
//                     ),
//                   ],
//                 ),
//               ),

//               // ✅ زر أضف إلى السلة
//               Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: ElevatedButton(
//                   onPressed: () {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: Text("تمت الإضافة إلى السلة")),
//                     );
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.red,
//                     padding: EdgeInsets.symmetric(vertical: 16),
//                     minimumSize: Size(double.infinity, 50),
//                   ),
//                   child: Text("أضف إلى السلة", style: TextStyle(fontSize: 18)),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
