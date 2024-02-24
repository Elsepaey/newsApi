import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  static const int categories=1;
  static const int setting=2;
  Function onItemClicked;

  SideMenu(this.onItemClicked, {super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          color: Theme.of(context).primaryColor,
          padding: const EdgeInsets.symmetric(vertical: 64),
          child: const Text(
            "News App!",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        InkWell(
          onTap: (){onItemClicked(categories);},
          child: const Row(
            children: [
              Icon(
                Icons.list,
                size: 54,
              ),
              Text(
                "Categories",
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
        ),
        InkWell(
          onTap:(){onItemClicked(setting);} ,
          child: const Row(
            children: [
              Icon(
                Icons.settings,
                size: 54,
              ),
              Text(
                "Setting",
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
        )
      ],
    );
  }
}
