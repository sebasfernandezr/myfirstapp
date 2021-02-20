import 'package:flutter/material.dart';
import 'package:flutter_myfirsapp_balcoder/ui/home_page.dart';
import 'package:flutter_myfirsapp_balcoder/ui/user/user_list_page.dart';
import 'package:flutter_myfirsapp_balcoder/ui/product/product_form_page.dart';
import 'package:flutter_myfirsapp_balcoder/ui/product/product_list_page.dart';
import 'package:flutter_myfirsapp_balcoder/ui/user/dashboard_widget.dart';

void main (){
  runApp(MyApp());
}
  class MyApp extends StatelessWidget {
    const MyApp({Key key}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: HomePage(), 
      title: "MI TITULO",
      );
    }
  }