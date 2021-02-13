import 'dart:convert';

import 'package:news_assignment_application/models/article_model.dart';
import 'package:http/http.dart' as http;
class News{
  List<ArticleModel> news = [];
  Future<void> getNews() async{
    String url= "https://newsapi.org/v2/top-headlines?country=us&apiKey=7d730577062c469094d352562061ffa5";

    var response= await http.get(url);
    var jsonData= jsonDecode(response.body);

    if(jsonData['status']=="ok"){
      jsonData["articles"].forEach((element){

        if(element["urlToImage"]!=null && element["description"]!=null)
          {
            ArticleModel articleModel= ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'],
            publishedAt: element['publishedAt'],
            );

            news.add(articleModel);

          }
      });


    }
  }
}