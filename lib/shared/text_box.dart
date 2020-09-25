import 'package:flutter/material.dart';



class TextBox extends StatelessWidget {


  final Icon icon;
  final String hintText;
  final TextEditingController textController;

  final TextInputType keyboardType;

  TextBox({this.icon , this.hintText,this.textController,this.keyboardType});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(30.0,2.0,30.0,20.0),
      child:



      TextField(
        keyboardType: keyboardType,


      style: TextStyle(
          fontSize: 20.0,
          height: 1.0,
        ),
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: icon,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),


        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),


      ),
      controller: textController,


      ),
    );


  }
}