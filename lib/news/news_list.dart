



import 'package:flutter/material.dart';
import 'package:newsapi/api/api_manager.dart';

import '../model/NewsResponce.dart';
import '../model/sorce_response.dart';
import 'newsWidget.dart';

class newsList extends StatelessWidget {
Source source;
newsList(this.source, {super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponce>(future:apiManager.getNewsbySourceId(source.id??""),
        builder: (buildContext, snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else if (snapshot.connectionState ==
              ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          var data = snapshot.data;
          if ('error' == data?.status) {
            return Text("${data?.message}");
          }
          return Expanded(
            child: ListView.builder(itemBuilder: (context,index){
              var article=data?.newsList![index];
              return newsWidget(article!);
            }),
          )
          ;

        });
  }
}
