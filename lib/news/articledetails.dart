import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:newsapi/home/finalAppBar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/NewsResponce.dart';

class ArticleDetails extends StatefulWidget {
  News article;

  ArticleDetails({required this.article, super.key});

  @override
  State<ArticleDetails> createState() => _ArticleDetailsState();
}

class _ArticleDetailsState extends State<ArticleDetails> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: App_Bar(screenHeight, screenWidth),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.article.title!,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              widget.article.urlToImage != null
                  ? CachedNetworkImage(
                      imageUrl: widget.article.urlToImage!,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
                  : const SizedBox(),
              const SizedBox(height: 16),
              Text(
                widget.article.source!.name!,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              Text(
                widget.article.author ?? '',
                style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 14),
              ),
              const SizedBox(height: 16),
              Text(
                widget.article.description ?? '',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Text(
                widget.article.content ?? '',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),

            Text(
                'Published at: ${widget.article.publishedAt}',
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              TextButton(
               onPressed:(){openUrl(widget.article.url);} , child: Row(children: [
                Text("View Full Article",style: TextStyle(color: Colors.blue,fontSize: 14),),
                const Icon(Icons.arrow_forward_ios_rounded,size: 18,color: Colors.black,)


              ],)),

            ],
          ),
        )));
  }

  openUrl(String? url) async {
    if(url==null)
      {return ;}
    else
      {
       var uri=Uri.parse(url);
       if(await canLaunchUrl(uri))
         {
          await  launchUrl(uri);
         }
       else{
         if (kDebugMode) {
           print("false");
         }
       }
      }
  }
}
