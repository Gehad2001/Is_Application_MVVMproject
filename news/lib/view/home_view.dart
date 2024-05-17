import 'package:flutter/material.dart';
import 'package:news/view/entertainment_view.dart';
import 'package:news/view/general_view.dart';
import 'package:news/view/health_view.dart';
import 'package:news/view/science_view.dart';
import 'package:news/view/sport_view.dart';
import 'package:news/view/technology_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "The News",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          backgroundColor: Colors.lightBlueAccent, // تحديد لون الخلفية
          elevation: 0,
        ),
        body: Stack(
          children: [
            Positioned(
              top: AppBar().preferredSize.height+29,
              left: 0,
              right: 0,
              bottom: 0,
              child: TabBarView(
                children: const [
                  GeneralScreen(),
                  HealthScreen(),
                  TechnologyScreen(),
                  ScienceScreen(),
                  SportScreen(),
                  EntertainmentScreen(),
                ],
              ),
            ),
            Positioned(
              top: 5,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.only(bottom: 8.0),
                decoration: BoxDecoration(
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: TabBar(
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(width: 6, color: Colors.lightBlueAccent), // تحديد عرض ولون الخط
                      insets: EdgeInsets.symmetric(horizontal: 16), // تحديد المسافة بين النص والخط
                    ),
                    isScrollable: true,
                    tabs: const [
                      Tab(
                        text: "General",
                        icon: Icon(Icons.article_outlined),
                      ),
                      Tab(
                        text: "Health",
                        icon: Icon(Icons.local_hospital),
                      ),
                      Tab(
                        text: "Technology",
                        icon: Icon(Icons.computer),
                      ),
                      Tab(
                        text: "Science",
                        icon: Icon(Icons.science),
                      ),
                      Tab(
                        text: "Sports",
                        icon: Icon(Icons.sports),
                      ),
                      Tab(
                        text: "Entertainment",
                        icon: Icon(Icons.sports),
                      ),
                    ],
                  ),

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
