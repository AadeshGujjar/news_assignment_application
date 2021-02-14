import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_assignment_application/helper/data.dart';
import 'package:news_assignment_application/helper/news.dart';
import 'package:news_assignment_application/models/article_model.dart';
import 'package:news_assignment_application/models/category_model.dart';
import 'package:news_assignment_application/views/article_views.dart';
import 'package:news_assignment_application/views/category_news.dart';

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

      SingleChildScrollView(

        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column( ///column replacement
            children: <Widget>[
              ///categories
              Container(

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
                padding: EdgeInsets.only(top: 16),
                child: ListView.builder(
                  itemCount: articles.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context,index){
                    return BlogTile(
                    imageUrl: articles[index].urlToImage,
                    title:articles[index].title,
                    description: articles[index].description,
                     url: articles[index].url,
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

class CategoryTile extends StatelessWidget {

  final String imageUrl, categoryName;
  CategoryTile({this.imageUrl,this.categoryName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
           Navigator.push(context, MaterialPageRoute(
             builder: (context)=>CategoryNews(
               category: categoryName.toLowerCase(),
             )
           ));
      },
      child: Container(
        margin: EdgeInsets.only(right: 15),
        child:
        Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(6.0),
              child: CachedNetworkImage(
                  imageUrl: imageUrl, width: 120, height: 60, fit: BoxFit.cover)),

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

  final String imageUrl,title, description, url;
  BlogTile({this.imageUrl,this.title,this.description, @required this.url});

    @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => ArticleView(
            blogUrl: url,

            )
        ),);
      },
       child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(imageUrl)),
          Text(title, style: TextStyle(
            fontSize: 17,
            color: Colors.black87,
            fontWeight: FontWeight.w500
          ) ,),
          SizedBox(height: 8.0,),
          Text(description, style:  TextStyle(
              color: Colors.black54
          ),),
          ],
        ),
      ),
    );
  }
}
