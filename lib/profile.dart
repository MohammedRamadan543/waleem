import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final List<Map<String, dynamic>> help = [
    {"name": "اللغة", "icon": Icons.language},
    {"name": "عن وليم", "icon": Icons.info_outline},
    {"name": "سياسة الخصوصية", "icon": Icons.privacy_tip_outlined},
    {"name": "الشروط والاحكام", "icon": Icons.rule},
    {"name": "الاسئلة الشائعة", "icon": Icons.help_outline},
    {"name": "قيم التطبيق", "icon": Icons.star_border},
    {"name": "مشاركة التطبيق", "icon": Icons.share},
    {"name": "تواصل معنا عبر الواتس اب", "icon": Icons.chat},
    {"name": "الاتصال بالدعم", "icon": Icons.support_agent},
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
          title: Text(
            "حسابي",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: double.infinity,
                    child: Card(
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(Icons.person_2_outlined, size: 50),
                          MaterialButton(
                            onPressed: () {},
                            child: Text(
                              "تسجيل الدخول",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_back,
                            textDirection: TextDirection.ltr,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "المساعدة والدعم",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: help.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(help[index]["icon"], size: 24),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: Text(
                                    help[index]["name"],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.arrow_back,
                                textDirection: TextDirection.ltr,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Icon(Icons.facebook, size: 40, color: Colors.blue[700]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
