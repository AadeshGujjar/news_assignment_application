import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_assignment_application/helper/data.dart';
import 'package:news_assignment_application/helper/news.dart';
import 'package:news_assignment_application/models/article_model.dart';
import 'package:news_assignment_application/models/category_model.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories= new List<CategoryModel>();
  List<ArticleModel> articles= new List<ArticleModel>();
  bool _loading=true;

  @override
  void initState(){
    super.initState();
    categories= getCategories();
    getNews();
  }

  getNews() async{
      News newsClass= News();
      await newsClass.getNews();
      articles= newsClass.news;
      setState(() {
        _loading=false;
      });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("News"),
            Text(" Assignment ", style: TextStyle(
                color: Colors.blue
            ),),
            Text("App"),
          ],
        ),
        elevation: 0.0,
      ),
      body: _loading? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      ):

      Container(
        child: Column(
          children: <Widget>[
            ///categories
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 70,
              child: ListView.builder(
                itemCount: categories.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return CategoryTile(
                    imageUrl: categories[index].imageUrl,
                    categoryName: categories[index].categoryName,
                  );
                },
              ),
            ),
            ///blogs
            Container(
              child: ListView.builder(
                itemCount: articles.length,
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                  return BlogTile(
                  imageUrl: articles[index].urlToImage,
                  title:articles[index].title,
                  description: articles[index].description,
                  );
              },
              ),
            )

          ],
        ),
      ),

    );
  }
}

class CategoryTile extends StatelessWidget {

  final imageUrl, categoryName;
  CategoryTile({this.imageUrl,this.categoryName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

      },
      child: Container(
        margin: EdgeInsets.only(right: 15),
        child:
        Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(6.0),
              child: Image.network(imageUrl, width: 120, height: 60, fit: BoxFit.cover)),

          Container(
            alignment: Alignment.center,
            width: 120, height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              color: Colors.black26,
            ),

            child: Text(categoryName, style:  TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),),
          )
        ],
      ), ),
    );
  }
}

class BlogTile extends StatelessWidget {

  final String imageUrl,title, description;
  BlogTile({@required this.imageUrl,@required this.title,@required this.description});

    @override
  Widget build(BuildContext context) {
    return Container( 
      child: Column(
        children: <Widget>[
          Image.network(imageUrl),
        Text(title),
        Text(description),
        ],
      ),
    );
  }
}
