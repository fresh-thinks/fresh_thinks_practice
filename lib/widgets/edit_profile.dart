import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fresh_thinks_practice/services/database.dart';
import 'package:fresh_thinks_practice/shared/text_box.dart';



class EditName extends StatelessWidget {

 final String text;
  final String value;
   EditName({this.text ,this.value});
  final FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController textController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit your $text'),
      ),

      body: ListView(
      children : [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 15.0),
          child: Text('Change your $text',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),),
        ),

       TextBox(
         hintText: 'Enter your text...',
         textController: textController,
       ),


       Center(
         child: RaisedButton(
           child: Text("Save Changes"),
           onPressed: () async {

            FirebaseUser user = await auth.currentUser();
            //final userid = user.uid;
            // DatabaseService db = DatabaseService(uid: userid);
            // db.updateData(text, textController.text);
            //print(userid);
            print(user.uid);

           },
         ),
       )

      ],

    ),


    );
  }
}









