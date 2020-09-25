import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fresh_thinks_practice/services/auth.dart';
import 'package:fresh_thinks_practice/shared/text_box.dart';


class SignUp extends StatefulWidget {
  static const routeName = '/signup_screen';

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _nameController = TextEditingController();

  final _phoneController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final users = Firestore.instance.collection('Users');

  final products = Firestore.instance.collection('products');



  SnackBar snackbar;

  @override
  Widget build(BuildContext context) {
    AuthService _auth = AuthService();

    Future<bool> signup () async {
      bool exist=false;

      final phone = "+91" + _phoneController.text.trim();


      await users.getDocuments().then((QuerySnapshot snap) {
        bool x=false;


        snap.documents.forEach((DocumentSnapshot doc) async {
          print(doc.documentID);
          if(doc.data['phoneNumber']== phone) {
            print("phone not exist");
            setState(() {
              x = true;

            });
            print (exist);

            //return false;

            //  setState(() {

            //   x = false;
            //  });


          }
          else {
            final result = await _auth.loginUser(phone, context);
            print(doc.data['phoneNumber']);
            print("phone exist");


            //return true;
          }


        });
        print("xyz");
        print(x);
        return x;

      }

      ).then((value) {
        print("abc");
        print(value);
        exist = value;
        //return value;
      });
      print("hhhhhh");
      return exist;


      //    bool exist = true;

      //         final phone = "+91" + _phoneController.text.trim();
      //        final name = _nameController.text.trim();
      //               final _auth = AuthService(name: name);
      //                   print("hello");

      //             users.getDocuments().then((QuerySnapshot snap) {
      //             snap.documents.forEach((DocumentSnapshot doc) async {
      //               if(!(doc.data['phoneNumber']== phone)) {
      //                 final result = await _auth.loginUser(phone, context);
      //                 print(doc.data['phoneNumber']);
      //                 setState(() {
      //                 exist = false;

      //                 });

      //               }
      //               else {
      //                 setState(() {
      //                 exist = true;

      //                 });


      //               }
      //               print("hellllo");
      //               print(doc.data);
      //              }



      //              );

      //           // final result = await _auth.loginUser(phone, context);


      //           }


      //           );
      //           return exist;
    }


    return Scaffold(
      key : _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,


      ),

      backgroundColor: Colors.white,
      body: Container(

        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [


              Image.asset('assets/fresh_logo.png',
                height: 200.0,),
              SizedBox(height: 20.0),

              Text("Sign Up for new account",style: TextStyle(fontSize: 23.0)),
              SizedBox(height: 35.0),
              TextBox(icon: Icon(Icons.person), hintText: 'Enter your Name',textController: _nameController ,keyboardType: TextInputType.name, ),
              TextBox(icon: Icon(Icons.phone), hintText: 'Enter your phone number',textController: _phoneController , keyboardType: TextInputType.phone),
              SizedBox(height: 10.0),
              SizedBox(
                width: 200.0,
                height: 40.0,
                child: FlatButton(
                    child: Text("Sign Up",
                      style: TextStyle(fontSize: 20.0),),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.black38,
                        ),

                        borderRadius: BorderRadius.circular(15.0)),
                    onPressed:() async{
                      snackbar = SnackBar(content: Text('your account already exist.please try logging in ' ));

                      await signup().then((exist) {
                        if (exist) {

                          _scaffoldKey.currentState.showSnackBar(snackbar);
                        }

                      });













                    } ),






              )


            ],
          ),
        ),
      ),





    );
  }
}