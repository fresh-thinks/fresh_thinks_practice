import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fresh_thinks_practice/screens/subslist.dart';
import 'itemList.dart';




class SubsScreen extends StatefulWidget
{
  @override

  State<StatefulWidget> createState()
  {

    return SubsScreenState();

  }
}

class SubsScreenState extends State<SubsScreen>
{

  final firestoreInstance = Firestore.instance;
  @override
  final users = Firestore.instance.collection('Users');
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(backgroundColor: Colors.yellow,title: new Text('My Subscriptions'),),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Colors.white]

            )
        ),

        child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text('SUBSCRIBE AND SAVE',style: TextStyle(color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 30),),
                  Text(
                    '                                                                                                                                      '
                        '                                The Star Wars opening crawl is a signature device of the opening sequences of every numbered film of the Star Wars series, an American epic space opera franchise created by George Lucas. Within a black sky background featuring a smattering of stars, the crawl is preceded both by the static blue text, "A long time ago in a galaxy far, far away...." and by the Star Wars logo which recedes toward a central point on the screen before disappearing. The crawl text, which describes the backstory and context of the film, then recedes toward a higher point in relation to the screen and with an apparent effect of disappearing in the distance. The visuals are accompanied by the "Main Title Theme", composed by John Williams.',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                      ),

                  SizedBox(height: 35),
                  RaisedButton(shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.green)
                  ),color: Colors.lightGreen,
                      child: Text
                        (
                        'View Lists',
                        style: TextStyle(color: Colors.black, fontSize: 18),

                        ),
                      onPressed: ()


                      { firestoreInstance.collection("users").getDocuments().then((querySnapshot) {
                        querySnapshot.documents.forEach((result) {
                          print(result.data);
                        });
                      });
                      }

                      ),
                  SizedBox(height: 20),

                  RaisedButton(shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.green)
                  ),color: Colors.lightGreen,
                      child: Text(
                        'Create New',
                        style: TextStyle(color: Colors.black, fontSize: 18),

                      ),
                      onPressed: ()
                      {
                        new StreamBuilder<QuerySnapshot>
                          (
                            stream: Firestore.instance.collection("products").snapshots(),
                            builder: (context, snapshot) {
                              return Container(
                                  child: snapshot.data==null? Center(
                                    child:CircularProgressIndicator(
                                      valueColor: new AlwaysStoppedAnimation(Color(0xff7CC03C)),
                                    ),
                                  ): new GridView.builder(gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                                      itemCount:snapshot.data.documents.length,
                                      controller: new ScrollController(keepScrollOffset: false),
                                      scrollDirection: Axis.vertical,
                                      padding: const EdgeInsets.all(4.0),
                                      itemBuilder:(BuildContext context,index){
                                        DocumentSnapshot data = snapshot.data.documents[index];
                                        return ProductItem(
                                          documentSnapshot:data,
                                          category:data['Category'],
                                          pName:data['pName'],
                                          price:data['price'],
                                          pid:data['pid'],
                                          image:data['image'],
                                          type:data['type'],
                                          id: data.documentID,
                                        );

                                      })
                              );
                            }
                        );

                      }












                  )
                ]

            )
        ),


      ),
    );
  }
}


String name;
class SubPage extends StatelessWidget{
  final firestoreInstance = Firestore.instance;
  @override

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(backgroundColor: Colors.yellow,title: new Text('My Subscriptions'),),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Colors.white]

            )
        ),

        child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text('Subscription List',style: TextStyle(color: Colors.grey[800],
                      fontWeight: FontWeight.w600,
                      fontSize: 30),),

                  SizedBox(height: 40),
               TextFormField(
              decoration: InputDecoration(border: new OutlineInputBorder(borderRadius: const BorderRadius.all(const Radius.circular(100.0))),labelText: 'List Name'),
              style: TextStyle(color: Colors.green, fontSize: 12),
              keyboardType: TextInputType.text,
              onSaved: (String value) {

              name = value;

              },
              ),

                  SizedBox(height: 20),

                  RaisedButton(shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.green)
                  ),color: Colors.lightGreen,
                      child: Text(
                        'View products to subscribe',
                        style: TextStyle(color: Colors.black, fontSize: 18),

                      ),
                      onPressed: () {
                      firestoreInstance.collection("users").add(
                      {

                      "name" : "vatsa",


                      }).then((value){
                      print(value.documentID);
                      });



                      }),




                ]
            )
        ),


      ),
    );
  }
}







