import 'dart:async';
import 'package:flutter/material.dart';

import 'package:waleem_1/cart.dart';
import 'package:waleem_1/categories/categoriesdetails1.dart';
import 'package:waleem_1/categories/maincategories.dart';
import 'package:waleem_1/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _getBody() {
    switch (_currentIndex) {
      case 0:
        return _buildHomeContent(); // الرئيسية
      case 1:
        return maincategoriespage(); // التصنيفات
      case 2:
        return CartPage(); // السلة
      case 3:
        return ProfilePage(); // حسابي
      default:
        return _buildHomeContent();
    }
  }

  int _currentIndex = 0;

  final List<Widget> pages = [maincategoriespage(), CartPage(), ProfilePage()];
  List<String> products = [
    "images/6248846141712409430.jpg",
    "images/images2.jpeg",
    "images/96.png",
  ];
  List<String> products2 = ["images/G.jpg", "images/c.jpeg", "images/m.jpg"];

  List<String> titles = ["قسم الغنم", "قسم البقري", "قسم الحاشي"];
  List<Map> maincategories = [
    {"imagename": "images/h.jpg", "title": "قطعيات حاشي بلدي"},
    {"imagename": "images/images1.jpeg", "title": "مصنعات اللحوم البقري"},
    {"imagename": "images/525.jpg", "title": "مصنعات الحاشي"},
    {"imagename": "images/nn.webp", "title": "غنم نعيمي"},
    {"imagename": "images/images1.jpeg", "title": "قطعيات اللحوم"},
    {"imagename": "images/h.jpg", "title": "قطعيات الحاشي"},
  ];
  List categoriesdetails1 = [];
  late PageController _pageController;
  late PageController _pageController2;
  int _currentPage1 = 0;
  int _currentPage2 = 0;
  late Timer _timer1;
  late Timer _timer2;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage1);
    _pageController2 = PageController(initialPage: _currentPage2);

    // ✅ سلايدر أول (منتجات)
    _timer1 = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage1 < products.length - 1) {
        _currentPage1++;
      } else {
        _currentPage1 = 0;
      }

      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage1,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });

    // ✅ سلايدر ثاني (products2)
    _timer2 = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage2 < products2.length - 1) {
        _currentPage2++;
      } else {
        _currentPage2 = 0;
      }

      if (_pageController2.hasClients) {
        _pageController2.animateToPage(
          _currentPage2,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _pageController2.dispose();
    _timer1.cancel();
    _timer2.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 40,
          currentIndex: _currentIndex, // يمكنك تغييره بناءً على الصفحة الحالية
          selectedItemColor: Colors.red, // اللون عند التحديد
          unselectedItemColor: Colors.blueGrey, // اللون عند عدم التحديد
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
            BottomNavigationBarItem(
              icon: Icon(Icons.category_sharp),
              label: 'التصنيفات',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'السلة',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'حسابي'),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),

        body: _getBody(),
      ),
    );
  }

  _buildHomeContent() {
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Text("مرحبا بك!", style: TextStyle(fontSize: 20)),
        ),
        Container(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, size: 30),
                  fillColor: Colors.grey[100],
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "البحث",
                  hintStyle: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(height: 5),

              // ✅ سلايدر مع عنوان وزر
              SizedBox(
                height: 100,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    PageView.builder(
                      controller: _pageController,
                      itemCount: products.length,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage1 = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                products[index],
                                fit: BoxFit.cover,
                              ),
                            ),

                            // ✅ العنوان + زر التفاصيل
                            Positioned(
                              top: 20,
                              bottom: 20,
                              right: 200,
                              left: 20,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 5,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    child: Text(
                                      "اطلب الان",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),

                    Positioned(
                      bottom: 5,
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(products.length, (index) {
                            return AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              width: _currentPage1 == index ? 15 : 8,
                              height: _currentPage1 == index ? 15 : 8,
                              decoration: BoxDecoration(
                                color:
                                    _currentPage1 == index
                                        ? Colors.white
                                        : Colors.grey,
                                shape: BoxShape.circle,
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(right: 15),
              child: Text("التصنيفات", style: TextStyle(fontSize: 30)),
            ),

            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => maincategoriespage()),
                );
              },
              child: Text(
                "المزيد",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.red,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: maincategories.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // ✅ عدد الأعمدة = 3
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.8, // يمكنك تعديل النسبة حسب الشكل الذي تريده
            ),
            itemBuilder: (context, index) {
              final category = maincategories[index];
              return GestureDetector(
                onTap: () {
                  final category = products[index];
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Categoriesdetails1(),
                      ),
                    );
                  }
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
        SizedBox(
          height: 100,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              PageView.builder(
                controller: _pageController2,
                itemCount: products2.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage2 = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          products2[index],
                          width: 300,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        left: 10,
                        child: Container(
                          margin: EdgeInsetsDirectional.all(30),
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            titles[index],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),

              Positioned(
                bottom: 5,
                child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(products.length, (index) {
                      return AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        width: _currentPage2 == index ? 15 : 8,
                        height: _currentPage2 == index ? 15 : 8,
                        decoration: BoxDecoration(
                          color:
                              _currentPage2 == index
                                  ? Colors.white
                                  : Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

String _getTitle() {
  switch (_getTitle()) {
    case 0:
      return 'الرئيسية';
    case 1:
      return 'التصنيفات';
    case 2:
      return 'السلة';
    case 3:
      return 'حسابي';
    default:
      return '';
  }
}
