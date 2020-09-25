import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ItemDetails extends StatefulWidget {
  final String title;
  final String productImage;
  final String tag;
  final String price;
  final String pName;
  final String desc;
  const ItemDetails({Key key, this.title,this.productImage,this.tag,this.pName,this.price,this.desc}) : super(key:key);
  @override
  _ItemDetailsState createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    int item = 0;
    final ThemeData theme  = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline.copyWith(color: Colors.white);
    final TextStyle descriptionStyle  = theme.textTheme.subhead;
    IconData _backIcon() {
      switch (Theme.of(context).platform) {
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
          return Icons.arrow_back;
        case TargetPlatform.iOS:
          return Icons.arrow_back_ios;
      }
      assert(false);
      return null;
    }

    IconData _add_icon() {
      switch (Theme.of(context).platform) {
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
          return Icons.add_circle;
        case TargetPlatform.iOS:
          return Icons.add_circle;
      }
      assert(false);
      return null;
    }
    IconData _sub_icon() {
      switch (Theme.of(context).platform) {
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
          return Icons.remove_circle;
        case TargetPlatform.iOS:
          return Icons.remove_circle;
      }
      assert(false);
      return null;
    }
    return new Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(_backIcon()),
          alignment: Alignment.centerLeft,
          tooltip: 'Back',
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text(widget.pName),
        backgroundColor: Color(0xff7CC03C),

      ),
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.green
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Card(
                shape: new OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.green)
                ),
                elevation: 4.0,
                child: Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 250.0,
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Positioned.fill(child: Image.asset('assets/fruits.png',fit: BoxFit.scaleDown,)),
                            Container(
                              alignment: Alignment.topLeft,
                              child: IconButton(
                                icon: const Icon(Icons.favorite_border),
                                onPressed: (){},
                              ),
                            ),
                            Container(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                icon: const Icon(Icons.share),
                                onPressed: (){},
                              ),
                            ),
                          ],
                        ),
                      )

                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                child: DefaultTextStyle(
                  style: descriptionStyle,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                            widget.pName,
                          style:  descriptionStyle.copyWith(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                        ),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          widget.price,
                          style: descriptionStyle.copyWith(
                            fontSize: 20.0,
                            color: Colors.black54),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                child: Card(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
                    child: DefaultTextStyle(
                      style: descriptionStyle,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              new IconButton(
                                  icon: Icon(_add_icon(),color: Color(0xff7CC03C)),
                                  onPressed: (){
                                    item+=1;
                                  },
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 2.0),
                              ),
                              Text(
                                item.toString(),
                                style: descriptionStyle.copyWith(
                                  fontSize: 20.0,
                                  color: Colors.black87)
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 2.0),
                              ),
                              new IconButton(
                                  icon: Icon(_sub_icon(),color: Color(0xff7CC03C)),
                                  onPressed: () {
                                    if(item<0){

                                    }else{
                                      item = item -1;
                                    }
                                  },
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Container(
                              alignment: Alignment.center,
                              child: new RaisedButton(
                                onPressed:(){},
                                textColor: Colors.black87,
                                color: Color(0xff7CC03C),
                                child: Text('ADD TO CART'),
                              )
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                )
              ),
              Padding(
                padding:  const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: new RaisedButton.icon(
                    textColor: Colors.black87,
                    color: Color(0xFF7CC03C),
                    onPressed: () {
                      // Respond to button press
                    },
                    icon: Icon(Icons.subscriptions),
                    label: Text("SUBSCRIPTION"),
                  ),
                ),

              ),
              Container(
                padding:  const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                child: DefaultTextStyle(
                  style: descriptionStyle,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text( 'Details',
                        style: descriptionStyle.copyWith(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 0.0),
                child: Text(widget.desc,
                maxLines: 10,
                style: TextStyle(fontSize: 13.0,color: Colors.black38)
                )
              ),
            ],
          ),
        ),
      ),

    );
  }
}