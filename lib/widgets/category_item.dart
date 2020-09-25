


import 'package:flutter/material.dart';
import 'package:fresh_thinks_practice/screens/category_screen.dart';
import 'package:fresh_thinks_practice/screens/itemList.dart';

import 'package:fresh_thinks_practice/screens/my_subscription.dart';


class CategoryItem extends StatelessWidget {
  final title;
  final image;

  CategoryItem({this.title,this.image});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    //final storage = FirebaseStorage(app: Firestore.instance.app ,storageBucket: 'gs://freshthinks-practice.appspot.com');
    //final ref =FirebaseStorage.instance.ref().child('categories').child(image);
    //String url;
    //final String url = ref.getDownloadURL().toString();
    //  getImage () async {
    //  await ref.getDownloadURL().then((value) => value);
    // }
   // final height = MediaQuery.of(context).size.height;

  // Future<dynamic> getUrl() async {

  //     await ref.getDownloadURL();
  //  }
    return Column(
      children: [
        Container(
              padding: EdgeInsets.all(2.0),
              height: 150.0,
              width: width*0.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0) ,
                border: Border.all(width: 3.0,color: Colors.lightGreen)
                         ),

              child: InkWell(child: Image.asset(image,
                      fit: BoxFit.fill,
                        ),


                     onTap:  () async {
                      //final  url = await getUrl().then((url) =>url);
                     //url =await getUrl();
                      //print(url);
                      if(title == 'Subscriptions') {

                         Navigator.of(context).push(MaterialPageRoute(builder: (ctx) =>SubsScreen()));

                      }
                      else {
                       Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => itemList(title: title,)



                       ),
                       );
                      }

                     },




          ),
        ),
        Text(title),
      ],
    );
  }
}