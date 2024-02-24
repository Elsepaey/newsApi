import 'package:flutter/material.dart';
import 'package:newsapi/home/categories.dart';

class CategoryWidget extends StatelessWidget {
  Categoryclass item;
  int index;
  CategoryWidget(this.item, this.index, {super.key});
  @override
  Widget build(BuildContext context) {
    var screenHeight=MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        color: item.color,
        borderRadius: const BorderRadius.all(Radius.circular(35)),

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            item.imageUrl,
            height: screenHeight/9,
            fit: BoxFit.fitHeight,
          ),
          Text(
            item.title,
            style: const TextStyle(fontSize: 22, color: Colors.black),
          )
        ],
      ),
    );
  }
}
