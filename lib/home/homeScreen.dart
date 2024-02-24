import 'package:flutter/material.dart';
import 'package:newsapi/home/categories.dart';
import 'package:newsapi/home/finalAppBar.dart';
import 'package:newsapi/search/search.dart';
import 'package:newsapi/news/News%20part.dart';

import '../setting/settingTap.dart';

class Homescreen extends StatefulWidget {
  static String route_name = "home";

  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int currentIndex = 0;
  List navBarItems = [
    const AssetImage("assets/icons/img_6.png"),
    const AssetImage("assets/icons/img_7.png"),
    const AssetImage("assets/icons/img_8.png"),
  ];
  List navBarTitles=["Search","categories","Setting"];

  @override
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth=MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(color: Colors.white
          //image: AssetImage("assets/")
          ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: App_Bar(screenHeight,screenWidth), // body: CurrentWidget,
        bottomNavigationBar: ClipRRect(


          child: BottomNavigationBar(

            currentIndex: currentIndex,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.black,
            backgroundColor: const Color(0xFF548F4A),
            items: [
              for (int i = 0;
                  i < navBarItems.length;
                  i++) ...<BottomNavigationBarItem>{
                BottomNavigationBarItem(

                    label: navBarTitles[i],
                    backgroundColor: Colors.white,
                    icon: InkWell(
                        onTap: () {
                          setState(() {
                            currentIndex = i;
                          });
                        },
                        child: ImageIcon(
                          navBarItems[i],
                          color:
                              i == currentIndex ? Colors.white : Colors.black,
                          size: screenHeight / 22,
                        )))
              }
            ],
          ),
        ),
        body: IndexedStack(
          index: currentIndex,
          children: [
            const Search(),
            Categories(OnCategoryClicked),
            const SettingsPage(),
          ],
        ),
      ),
    );
  }

  void OnCategoryClicked(Categoryclass category) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => NewsParts(category)));
    //setState((){});
  }
}
