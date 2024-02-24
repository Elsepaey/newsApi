import 'package:flutter/material.dart';
import 'package:newsapi/api/api_manager.dart';
import 'package:newsapi/home/categories.dart';
import 'package:newsapi/home/finalAppBar.dart';
import 'package:newsapi/model/sorce_response.dart';
import 'package:newsapi/news/taps.dart';

class NewsParts extends StatelessWidget {
Categoryclass categoryItem;
NewsParts(this.categoryItem, {super.key});
  @override
  Widget build(BuildContext context) {
    var screenHeight=MediaQuery.of(context).size.height;
    var screenWidth=MediaQuery.of(context).size.width;

    return
      Scaffold(
      appBar: App_Bar(screenHeight,screenWidth),
      body: Column(
        children: [
          SizedBox(height: screenHeight/70,),
          FutureBuilder<SorceResponse>(
              future: apiManager.getNewsSources(categoryItem.id),
              builder: (buildContext, snapshot) {
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                else if (snapshot.connectionState ==
                    ConnectionState.waiting)
                {
                  return const CircularProgressIndicator();
                }
                var data = snapshot.data;
                if ('error' == data?.status) {
                  return Text("${data?.message}");
                }
                var sources = data?.sources;
                return Tabs(Source_List: sources??[]);
              }),

        ],
      ),
    );
  }
}
