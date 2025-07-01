import 'package:flutter/material.dart';
import 'package:waleem_1/categories/categoriesdetails1.dart';

class maincategoriespage extends StatefulWidget {
  const maincategoriespage({super.key});

  @override
  State<maincategoriespage> createState() => _maincategoriespageState();
}

class _maincategoriespageState extends State<maincategoriespage> {
  List<Map> Categories = [
    {"imagename": "images/h.jpg", "title": "قطعيات حاشي بلدي"},
    {"imagename": "images/images1.jpeg", "title": "مصنعات اللحوم البقري"},
    {"imagename": "images/525.jpg", "title": "مصنعات الحاشي"},
    {"imagename": "images/nn.webp", "title": "غنم نعيمي"},
    {"imagename": "images/images1.jpeg", "title": "قطعيات اللحوم"},
    {"imagename": "images/h.jpg", "title": "قطعيات الحاشي"},
    {"imagename": "images/imagesgoat.jpeg", "title": "غنم سواكي"},
    {"imagename": "images/imageshair.jpeg", "title": " غنم نجدي"},
    {"imagename": "images/white.jpeg", "title": "غنم حري"},
  ];
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
          title: Text("التصنيفات"),

          centerTitle: true,

          actions: [],
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: Categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // ✅ عدد الأعمدة = 3
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio:
                      0.8, // يمكنك تعديل النسبة حسب الشكل الذي تريده
                ),
                itemBuilder: (context, index) {
                  final category = Categories[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Categoriesdetails1(),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ClipOval(
                              child: Image.asset(
                                category["imagename"],
                                width: 80, // ⬅️ الحجم الدائري للصورة
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              category["title"],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
