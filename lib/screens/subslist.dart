import 'package:flutter/material.dart';
import 'package:fresh_thinks_practice/screens/itemList.dart';
import 'package:fresh_thinks_practice/screens/itemsDetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fresh_thinks_practice/operations/operation.dart';

class ProductItem extends StatefulWidget {
  final String category;
  final String pName;
  final String price;
  final String image;
  final String type;
  final String pid;
  final DocumentSnapshot documentSnapshot;
  final String id;
  ProductItem({
    @required this.documentSnapshot,
    @required this.category,
    @required this.pName,
    @required this.price,
    @required this.image,
    @required this.type,
    @required this.pid,
    @required this.id
  });
  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {

  bool isFavorite = false;
  String  uid  = getUid() as String;
  String docid = getDocId() as String;

  @override
  Widget build(BuildContext context) {
    bool doExist = checkIfDocExists(docid) as bool;
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle =
    theme.textTheme.headline.copyWith(color: Colors.white);
    final TextStyle descriptionStyle = theme.textTheme.subhead;
    return SafeArea(
        top: false,
        bottom: false,
        child: Container(
            height: 566.0,
            padding: const EdgeInsets.all(4.0),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ItemDetails(title: widget.category,productImage:widget.image,tag:widget.type,price: widget.price,pName:widget.pName,)));
              },
              child : Card(
                elevation: 4.0,
                shape: new OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Color(0xff7CC03C))

                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 120.0,
                      child: Stack(
                        children: <Widget>[
                          Positioned.fill(child: Image.network(widget.image,fit: BoxFit.scaleDown,),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: IconButton(
                              onPressed: (){
                                if(!doExist){
                                  DocumentReference reference = Firestore.instance.document("Favorites/" + uid );
                                  editProduct(isFavorite, uid);

                                }
                                uploadingData(widget.pName,  widget.price, widget.image, isFavorite, docid);
                              },
                              icon:isFavorite
                                  ?Icon(
                                  Icons.favorite,
                                  color: Colors.green
                              )
                                  : Icon(
                                Icons.favorite_border,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            child: IconButton(icon: const Icon(Icons.add_shopping_cart),
                                onPressed: (){}),             )
                        ],
                      ),
                    ),
                    //Divider(),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0)  ,
                        child: DefaultTextStyle(
                          style: descriptionStyle,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  widget.pName,
                                  style: descriptionStyle.copyWith(color: Colors.black87),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  widget.price+"/Kg",
                                  style: descriptionStyle.copyWith(color: Colors.black54),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 90.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          width: 0.8,
                          color: Colors.black,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              '-',
                              style: TextStyle(
                                color: Color(0xff7CC03C),
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(width: 20.0),
                          Text(
                            "0 kg",
                            style: TextStyle(
                              fontSize: 10.0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(width: 20.0),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              '+',
                              style: TextStyle(
                                color: Color(0xff7CC03C),
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding:const EdgeInsets.only(bottom: 8.0),
                    )
                  ],
                ),
              ),
            )
        ));

  }
}
