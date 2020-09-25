import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {

   String title;
  CategoryScreen({this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),



    );
  }
}