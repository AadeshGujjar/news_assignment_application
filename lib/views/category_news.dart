import 'package:flutter/material.dart';
import 'package:news_assignment_application/helper/news.dart';
import 'package:news_assignment_application/models/article_model.dart';

import 'home.dart';

class CategoryNews extends StatefulWidget {
  final String category;
  CategoryNews({this.category});

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {

  List<ArticleModel> article= new List<ArticleModel>();
  bool _loading= true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async{
    CategoryNewsClass newsClass= CategoryNewsClass();
    await newsClass.getNews(widget.category);
    article= newsClass.news;
    setState(() {
      _loading=false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text(" Assignment ", style: TextStyle(
                color: Colors.blue
            ),),
            Text("App"),
          ],
        ),
        actions: <Widget>[
          Opacity(
            opacity: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.save),
            ),
          )
        ],

        elevation: 0.0,
      ),
        body:  _loading? Center(
          child: Container(
            child: CircularProgressIndicator(),
          ),
        ):

        SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 16),
                  child: ListView.builder(
                    itemCount: article.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context,index){
                      return BlogTile(
                        imageUrl: article[index].urlToImage,
                        title:article[index].title,
                        description: article[index].description,
                        url: article[index].url,
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),

    );
  }
}
