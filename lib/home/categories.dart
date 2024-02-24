import 'package:flutter/material.dart';
import 'package:newsapi/home/CategoryWidget.dart';

class Categories extends StatelessWidget {
  var categoriesList = Categoryclass.getAllCategories();
  Function oncategoryclick;
  Categories(this.oncategoryclick, {super.key});
  @override
  Widget build(BuildContext context) {
    var screenHeight=MediaQuery.of(context).size.height;

    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 12,vertical: screenHeight/15),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
        itemBuilder: (_, index) {
          return InkWell(
              onTap: () {
                oncategoryclick(categoriesList[index]);
              },
              child: CategoryWidget(categoriesList[index], index));
        },
        itemCount: categoriesList.length,
      ),
    );
  }
}

class Categoryclass {
  String id;
  String title;
  Color color;
  String imageUrl;
  Categoryclass(this.id, this.title, this.color, this.imageUrl);
  static List<Categoryclass> getAllCategories() {
    return [
      Categoryclass(
          "sports", "Sports", const Color(0xFFD9D9D9).withOpacity(0.5), "assets/icons/img.png"),
      Categoryclass("entertainment", "Entertainment", const Color(0xFFD9D9D9).withOpacity(0.5),
          "assets/icons/img_1.png"),
      Categoryclass("health", "Health", const Color(0xFFD9D9D9).withOpacity(0.5),
          "assets/icons/img_2.png"),
      Categoryclass("business", "Business", const Color(0xFFD9D9D9).withOpacity(0.5),
          "assets/icons/img_3.png"),
      Categoryclass("technology", "'Technology", const Color(0xFFD9D9D9).withOpacity(0.5),
          "assets/icons/img_4.png"),
      Categoryclass(
          "science", "Science", const Color(0xFFD9D9D9).withOpacity(0.5), "assets/icons/img_5.png")
    ];
  }
}
