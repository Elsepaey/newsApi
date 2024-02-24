import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapi/news/dateUtils.dart';

import '../model/NewsResponce.dart';
import 'articledetails.dart';




class newsWidget extends StatelessWidget {
 News news;
 newsWidget(this.news, {super.key});

  @override
  Widget build(BuildContext context) {
    return
      Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(0.8),
          child: CachedNetworkImage(
            height: 230,width: double.infinity,fit: BoxFit.cover,
            imageUrl: news.urlToImage??"",
            placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),


     Text(news.author??"",style: const TextStyle(color: Color(0xFF79828B),fontSize: 12),),
        Text(news.title??"",style: const TextStyle(color: Color(0xFF42505C),fontSize: 18,fontWeight: FontWeight.w500),),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(

                   // fixedSize: const Size(100, 60),
                    backgroundColor: const Color(0xFF66C649).withOpacity(0.5)),
    onPressed: (){
    Navigator.push(context,
        MaterialPageRoute(builder: (context)=>ArticleDetails(article:news)));
    }, child: const Text("Details",style: TextStyle(color: Colors.black87),)),
            Text( MyDateUtils.FormatNewsDate(news.publishedAt??""),style: const TextStyle(color: Color(0xFF79828B),fontSize: 12),textAlign: TextAlign.end,),
          ],
        ),
Container(height: 8,color: Colors.black,)
    ],);
  }
}
