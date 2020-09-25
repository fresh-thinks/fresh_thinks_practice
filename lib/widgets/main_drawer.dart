import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fresh_thinks_practice/screens/customerServices.dart';
import 'package:fresh_thinks_practice/screens/faqs.dart';
import 'package:fresh_thinks_practice/screens/form_screen.dart';
import 'package:fresh_thinks_practice/screens/home_screen.dart';
import 'package:fresh_thinks_practice/screens/my_subscription.dart';
import 'package:fresh_thinks_practice/screens/profile_screen.dart';
import 'package:fresh_thinks_practice/screens/termsConditions.dart';
import 'package:fresh_thinks_practice/screens/welcome_screen.dart';



class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  final FirebaseAuth auth= FirebaseAuth.instance;

  // String name = "";

  //   Future<String> getData ()   async {
  //     FirebaseUser user = await auth.currentUser();
  //   final users = Firestore.instance.collection("Users");
  //     final userid = user.uid;
  //    print(userid);
  //    print(userid);
  //    print(userid);
  // //    return 'anuroop' ;
  //  name =await  users.document(userid).get().then((value) => value['name']);
  // // print(name);
  // return name;



  //  }

  //  getName() async {
  //    await getData().then((value) {

  //       print (value);
  //       print('adadsa');
  //       name = value;
  //    });


  //  }


  //  @override
  //   void initState () {
  //    getName();
  //   super.initState();
  //  }


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          SizedBox(height: 20.0),
          Container(
            height: 160,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ProfileScreen()));

                  },
                  child: CircleAvatar(
                    child: Image.asset("assets/fresh_logo.png",
                    fit: BoxFit.fill,
                    ),
                    radius: 50,
                    backgroundColor:Colors.transparent
                    ),
                ),

                  Expanded(
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 1.0),

                      Text( 'Fresh Thinks',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                        ),

                        Row(

                        children: [
                       IconButton(icon: Icon(Icons.location_on),
                         onPressed: ()
                         =>
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ProfileScreen())),
                         ),
                         Expanded(child: Text("Flat No. 420 ,Abc Colony - 500012,")),


                         ],


                          ),










                      ],





                    ),
                  ),





              ],
            )
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0 , vertical: 0.0),
            child: Divider(
              thickness: 0.5,
              color: Colors.black87,)),

          Column(
            children: [
              ListTile(
               leading: Icon(Icons.home),
                title: Text("Home", style: TextStyle(fontSize: 20.0)),
                dense: true,
                onTap: () =>
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen())) ,
              ),

              ListTile(
                leading: Icon(Icons.import_contacts),
                title: Text("Subscriptions", style: TextStyle(fontSize: 20.0)),
                onTap: () {

                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SubsScreen()));
                },
              ),

              // ListTile(
              //     leading: Icon(Icons.fastfood),
              //     title: Text("Today's  Deals", style: TextStyle(fontSize: 20.0)),
              //     onTap: () {},
              //   ),


              Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0 , vertical: 1.0),
            child: Divider(
              thickness: 0.5,
              color: Colors.black,)),


              ListTile(
                  leading: Icon(Icons.store),
                  title: Text("Shop by Category", style: TextStyle(fontSize: 20.0)),
                  onTap: () {},
                ),




                ListTile(
                    leading: Icon(Icons.restaurant),
                    title: Text("Shop by Recipe", style: TextStyle(fontSize: 20.0)),
                    onTap: () {},
                  ),


              Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0 , vertical: 1.0),
            child: Divider(
              thickness: 0.5,
              color: Colors.black)),


              //  ListTile(
              //       leading: Icon(Icons.language),
              //       title: Text("Notifications", style: TextStyle(fontSize: 20.0)),
              //       onTap: () {},
              //     ),
                  ListTile(
                    leading: Icon(Icons.account_balance_wallet),
                    title: Text("Wallet", style: TextStyle(fontSize: 20.0)),
                    onTap: () {},
                  ),

                  ListTile(
                    leading: Icon(Icons.location_city),
                    title: Text("Addresses", style: TextStyle(fontSize: 20.0)),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> FormScreen()));
                    },
                  ),

                   ListTile(
                    leading: Icon(Icons.favorite),
                    title: Text("Favourites", style: TextStyle(fontSize: 20.0)),
                    onTap: () {},
                  ),

                   ListTile(
                    leading: Icon(Icons.receipt),
                    title: Text("My Orders", style: TextStyle(fontSize: 20.0)),
                    onTap: () {},
                  ),




                  Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0 , vertical: 1.0),
            child: Divider(
              thickness: 0.5,
              color: Colors.black)),

              // ListTile(
              //       leading: Icon(Icons.settings),
              //       title: Text("Settings", style: TextStyle(fontSize: 20.0)),
              //       onTap: () {},
              //     ),

                  ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text("Customer Services", style: TextStyle(fontSize: 20.0)),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CustomerService()));
                    },
                  ),


                  ListTile(
                    leading: Icon(Icons.error),
                    title: Text("FAQs", style: TextStyle(fontSize: 20.0)),
                    onTap: () {

                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=> FAQs()));


                    },
                  ),

                  ListTile(
                    leading: Icon(Icons.description),
                    title: Text("Terms and Conditions", style: TextStyle(fontSize: 20.0)),
                    onTap: () {
                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=> TermsConditions()));

                    },
                  ),

                  ListTile(
                    leading: Icon(Icons.exit_to_app),
                    title: Text("Logout", style: TextStyle(fontSize: 20.0)),
                    onTap: () async{

                      auth.signOut();
                      FirebaseAuth auth1 = FirebaseAuth.instance;
                      FirebaseUser user = await auth1.currentUser();
                      if(user == null) {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> WelcomeScreen()));


                      }


                    },
                  ),






























            ],
          ),









        ],
      ),
    );
  }
}