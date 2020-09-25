

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fresh_thinks_practice/models/category.dart';
import 'package:fresh_thinks_practice/services/auth.dart';
import 'package:fresh_thinks_practice/shared/dataList.dart';
import 'package:fresh_thinks_practice/widgets/category_item.dart';
import 'package:fresh_thinks_practice/widgets/main_drawer.dart';
import 'package:fresh_thinks_practice/widgets/search_bar.dart';



class HomeScreen extends StatefulWidget {

  static const routeName = '/home-screen';




  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

 // void getData () async {

//  categories =  Firestore.instance.collection("Categories").getDocuments();

 // }

  final List<Category> categories1 = [
   //Firestore.instance.collection("Categories").getDocuments();


    Category (
      title : 'Subscriptions',
      image : 'assets/subscriptions.png'
    ),

    Category (
      title : 'vegetable',
      image : 'assets/vegetables2.png'
    ),

    Category (
      title : 'fruit',
      image : 'assets/fruits.png'
    ),

    Category (
      title : 'Offers',
      image : 'assets/offers.png'
    ),

    Category (
      title : 'Organic',
      image : 'assets/organic.png'
    ),

    Category (
      title : 'Recommended',
      image : 'assets/recommended.png'
    ),






  ];



  AuthService _auth = AuthService();
   FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();

  }






  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: Text('FreshThinks',
        style: TextStyle(
          fontFamily: 'Cookie',
          fontSize: 30,
        ),),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,

        actions: [
          // IconButton(
          //   icon: Icon(Icons.exit_to_app),
          //   onPressed: () {
          //     AuthService auth = AuthService();
          //     auth.signOut();

          //   }),

          Icon(Icons.notifications,
           ),
          Text("   "),
          Icon(Icons.shopping_cart),
          Text(" "),

        ],

      ),
      drawer: MainDrawer(),

      // body: StreamBuilder<QuerySnapshot>(
      //   stream: Firestore.instance.collection("Categories").snapshots(),
      //   builder: (BuildContext context , AsyncSnapshot<QuerySnapshot> snap)  {
      //    final length = snap.data.documents.length;
      //    print(length);

      //         return
          body:     ListView(
          children: [
        Container(

          color: Colors.white,
          height: 80.0,
          child: Center(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  elevation: 20.0,
                  child: TextField(

            focusNode: myFocusNode,


            decoration: InputDecoration(
              hintText: 'search...',
              enabledBorder: OutlineInputBorder(

                  borderSide: BorderSide(

                    color: Colors.transparent,
                    width: 1.0,
                  )
              ),
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: IconButton(icon: Icon(Icons.mic), onPressed: null),


            ),
            onTap: () =>
            {
            showSearch(context: context, delegate: DataSearch(listWords)),
            myFocusNode.dispose(),
            }



                  ),
                ),
              ),
          ),
        ),



            CarouselSlider(
  options: CarouselOptions(height: 110.0,
  viewportFraction: 1,
  autoPlayAnimationDuration: Duration(seconds: 1),
  autoPlayInterval: Duration(seconds: 1),
  initialPage: 1,
  enableInfiniteScroll: true,
  ),
  items: [1,2,3].map((i) {
    return Builder(
        builder: (BuildContext context) {
          return Container(

            width:double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 0.0),
            decoration: BoxDecoration(
          color: Colors.orangeAccent,
            ),
            child: Center(child: Text('image $i', style: TextStyle(fontSize: 16.0),))
          );
        },
    );
  }).toList(),
),

        GridView.builder(
          physics: ScrollPhysics(),
            padding: EdgeInsets.all(15.0),
            itemCount: categories1.length,
            shrinkWrap: true,
            itemBuilder:(context ,i) => CategoryItem(
          title: categories1[i].title,
          image : categories1[i].image,
          // title: categories[i].documentId,
          // image: categories.data['image'],
            ) ,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0),




          )







          ],

            )

      );








  }
}