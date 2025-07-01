import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(2),
            child: Container(color: Colors.red, height: 2),
          ),
          title: Text("السلة"),
          centerTitle: true,

          actions: [],
        ),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "المنتجات (0)",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: Card(
                color: Colors.white,
                child: Image.asset(
                  "images/pngtree-empty-cardboard-box-pack-png-image_10005921.png",
                ),
              ),
            ),
            Text("ر.س 00.0         المجموع الفرعي(0)منتج"),
            Container(height: 30),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: MaterialButton(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.redAccent,
                onPressed: () {},
                child: Text("تأكيد الطلب"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
