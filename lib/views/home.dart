import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_assignment_application/helper/data.dart';
import 'package:news_assignment_application/models/category_model.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories= new List<CategoryModel>();
  @override
  void initState(){
    super.initState();
    categories= getCategories();
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
      body: Container(
        child: Column(
          children: <Widget>[
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

  const BlogTile({Key key, this.imageUrl, this.title, this.description}) : super(key: key);
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
