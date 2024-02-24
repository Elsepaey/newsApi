import 'package:flutter/material.dart';
import 'package:newsapi/news/tapItem.dart';

import 'news_list.dart';

class Tabs extends StatefulWidget {
  List Source_List;

  Tabs({super.key, required this.Source_List});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  var selected = 0;

  @override
  Widget build(BuildContext context) {
    var screenHeight=MediaQuery.of(context).size.height;

    return Expanded(
      child: DefaultTabController(
          length: widget.Source_List.length,
          child: Column(
            children: [
              TabBar(

                onTap: (index) {
                  selected = index;
                  setState((){});
                },
                indicatorColor: Colors.transparent,
                isScrollable: true,
                tabs: widget.Source_List.map((Sources) {
                  var isSelected=widget.Source_List.indexOf(Sources)==selected;
                  return TapItem(source: Sources, is_selected: isSelected);
                }).toList(),
              ),
              SizedBox(height: screenHeight/70,),

              newsList(widget.Source_List[selected]),
            ],
          )),
    );
  }
}
