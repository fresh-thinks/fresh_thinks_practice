import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fresh_thinks_practice/widgets/product_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class itemList extends StatefulWidget


{



  final String title;
  final String catImage;
  final String tag;
  const itemList({Key key, this.title,this.catImage,this.tag})
  : super(key:key);
  @override
  _itemListState createState() => _itemListState();
}

class _itemListState extends State<itemList> {
//  List<Products> productList=[];
  DocumentSnapshot documentSnapshot;
  @override
 /* void initState(){
    super.initState();
    StreamBuilder<QuerySnapshot>(
     stream: Firestore.instance.collection("Products").orderBy("category").snapshots(),
     Doc
    );
  }*/
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text(widget.title, textAlign: TextAlign.center,),
        automaticallyImplyLeading: true,
        leading: IconButton(icon: Icon(Icons.arrow_back),
        onPressed: () {Navigator.pop(context);}
        ),
      actions: <Widget>[
        IconButton(
          onPressed: (){},
          icon: Icon(Icons.search),
        ),
      ],
      backgroundColor: Color(0xff7CC03C),
      elevation: 30.0,
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context,bool innerBoxIsScrolled){return <Widget>[];
        },
        body: StreamBuilder<QuerySnapshot>(
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
                   print(snapshot.data.documents.length);
                  DocumentSnapshot data = snapshot.data.documents[index];


                  if (widget.title == data['category']){

                  return ProductItem(
                  documentSnapshot:data,
                  category:data['category'],
                  pName:data['name'],
                  price:data['price'],
                  pid:data['id'],
                  image:data['image'],
                  type:data['type'],
                  desc : data['description'],
                  );
                  }
              })
            );
          }
        ),),
    );
  }
}