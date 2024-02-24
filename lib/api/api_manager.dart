import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapi/model/sorce_response.dart';

import '../model/NewsResponce.dart';

class apiManager {
  static String baseUrl = "newsapi.org";
  static String Key = "d07ae0ccbf1b4a9cbc0219aaea98ba69";
  static Future<SorceResponse> getNewsSources(catId) async {
    var uri = Uri.https(baseUrl, "/v2/top-headlines/sources",
        {"apiKey": Key, "category": catId});
    var response = await http.get(uri);
    var responseBody = response.body;
    var json = jsonDecode(responseBody);
    SorceResponse sourceResponce = SorceResponse.fromJson(json);
    return sourceResponce;
  }

  static Future<NewsResponce> getNewsbySourceId(String sourceId) async {
    var uri = Uri.https(
        baseUrl, "/v2/everything", {"apiKey": Key, "sources": sourceId});
    var response = await http.get(uri);
    var responseBody = response.body;
    var json = jsonDecode(responseBody);
    NewsResponce newsResponce = NewsResponce.fromJson(json);
    return newsResponce;
  }

  static Future<List<dynamic>> fetchSearchNews(String query) async {
    var uri = Uri.https(baseUrl, "/v2/everything", {"apiKey": Key, "q": query});

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return json.decode(response.body)['articles'];
    } else {
      throw Exception('Failed to load news');
    }
  }
  static Future<List<dynamic>> fetchGeneralNews() async {
   // var uri = Uri.https( baseUrl, "/v2/top-headlines", {"sources":"bbc-news","apiKey": Key});
    var uri = Uri.https( "newsapi.org","/v2/top-headlines",{"apiKey":Key,"category":"general","country":"us"});


    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return json.decode(response.body)['articles'];
    } else {
      throw Exception('Failed to load news');
    }
  }

}
