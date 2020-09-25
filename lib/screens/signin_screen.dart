import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fresh_thinks_practice/screens/home_screen.dart';
import 'package:fresh_thinks_practice/services/auth.dart';
import 'package:fresh_thinks_practice/shared/text_box.dart';


class SignIn extends StatefulWidget {
  static const routeName = '/signin_screen';

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _phoneController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final _auth = AuthService();



  SnackBar snackBar;

  final users = Firestore.instance.collection('Users');

  @override
  Widget build(BuildContext context) {

    Future <bool> signin() async {
      bool exist=false;

      final phone = "+91" + _phoneController.text.trim();


      await users.getDocuments().then((QuerySnapshot snap) {
        bool x=false;


        snap.documents.forEach((DocumentSnapshot doc) async {
          print(doc.documentID);
          if(doc.data['phoneNumber']== phone) {
            final result = await _auth.loginUser(phone, context);
            print(doc.data['phoneNumber']);
            print("phone exists");
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));



            //return false;

            //  setState(() {

            //   x = false;
            //  });


          }
          else {
            print("phone not exist");
            setState(() {
              x = true;

            });
            print (exist);
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
      // print(exist);
      // print("hello");
      // return exist;
    }




    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,

        ),

        backgroundColor: Colors.white,
        body:  Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                SizedBox(height: 60.0),
                Image.asset('assets/fresh_logo.png',
                  height: 200.0,),
                SizedBox(height: 20.0),

                Text("Sign in with phone Number",style: TextStyle(fontSize: 23.0)),
                SizedBox(height: 35.0),
                //TextBox(icon: Icon(Icons.person), hintText: 'Enter your Name',textController: _nameController ,keyboardType: TextInputType.name, ),
                TextBox(icon: Icon(Icons.phone), hintText: 'Enter your phone number',textController: _phoneController , keyboardType: TextInputType.phone),
                SizedBox(height: 10.0),
                SizedBox(
                  width: 200.0,
                  height: 40.0,
                  child: FlatButton(
                      child: Text("Sign in",
                        style: TextStyle(fontSize: 20.0),),
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.black38,
                          ),

                          borderRadius: BorderRadius.circular(15.0)),
                      onPressed:() async{

                        final snackbar = SnackBar(content: Text('your account doesn t exist.please try signing up ' ));

                        await signin().then((exist) {
                          print(exist);
                          print("acacacacac");
                          if (exist) {
                            print(exist);

                            _scaffoldKey.currentState.showSnackBar(snackbar);
                          }

                        });















                      }

                  ),
                )








              ],
            ),
          ),
        )







    );
  }
}