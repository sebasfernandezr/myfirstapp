import 'package:flutter/material.dart';
import 'package:flutter_myfirsapp_balcoder/ui/home_page.dart';

void main (){
  runApp(MyApp());
}
  class MyApp extends StatelessWidget {
    const MyApp({Key key}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      home: HomePage(), 
      title: "MI TITULO",
      );
    }
  }