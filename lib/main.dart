import 'package:flutter/material.dart';
import 'file:///E:/Flutter/my_flutter_project/news_assignment_application/lib/view_model/home.dart';


void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        primaryColor: Colors.white,
      ),
      home: Home(),
    );
  }
}
