

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';


class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {



      final categories = Firestore.instance.collection("Categories");
       final storage = FirebaseStorage(app: Firestore.instance.app ,storageBucket: 'gs://freshthinks-practice.appspot.com');
    final ref =FirebaseStorage.instance.ref().child('categories/fruits.png');
      Future<dynamic> getImage () async {
      return await ref.getDownloadURL();
    }



    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text("Data"),
          onPressed: () async {
            FirebaseAuth auth = FirebaseAuth.instance;
            final  FirebaseUser user = await auth.currentUser();
            print(user.uid);
          //   categories.getDocuments().then((QuerySnapshot snap) {
          //  final  id = snap.documents.length;
          //        print(id);
          //        final url = getImage();
          //        print(url);
          //        print(url);




          //   });




          },
        ),
      ),



    );
  }
}