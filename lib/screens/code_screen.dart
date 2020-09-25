import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fresh_thinks_practice/screens/home_screen.dart';
import 'package:fresh_thinks_practice/services/auth.dart';
import 'package:fresh_thinks_practice/services/database.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

// ignore: must_be_immutable
class CodeScreen extends StatefulWidget {
  //static const routeName = '/signin_screen';

  //final _nameController = TextEditingController();
  final String verificationId ;
  final BuildContext ctx;
  String phone;
  String name;

    CodeScreen({this.verificationId, this.ctx,this.phone,this.name});

  @override
  _CodeScreenState createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodeScreen> {


  final _codeController = TextEditingController();
  StreamController<ErrorAnimationType> errorController =StreamController<ErrorAnimationType>();
  bool hasError = false;
  String currentText="";
  final formKey =GlobalKey <FormState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //AuthService _authverify =AuthService();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
   final height =  MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,

      ),

      backgroundColor: Colors.white,
      body: Container(
        height: height,
        child: SingleChildScrollView(
                child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [

              Image.asset('assets/freshthinks_logo.png',
              height: 200.0,),
              SizedBox(height: height*0.02),


              Text("Enter the OTP",style: TextStyle(fontSize: 23.0)),
              SizedBox(height: height*0.05),

              Form(
                key:  formKey,

                 child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: PinCodeTextField(
                    appContext: context,


                    length: 6,

                   // obsecureText: false,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(15),
                      fieldHeight: height*0.08,
                      fieldWidth : 50,
                      activeFillColor: Colors.transparent,
                      inactiveFillColor: Colors.transparent,
                      selectedFillColor: Colors.transparent,
                      activeColor: Colors.green,
                      inactiveColor: Colors.green,
                      disabledColor: Colors.green,



                      ),
                      autoDismissKeyboard: true,
                      //textInputType: TextInputType.number,
                      autoDisposeControllers: true,
                      animationDuration: Duration(milliseconds: 300),
                      enableActiveFill: true,
                      errorAnimationController: errorController,
                      controller: _codeController,
                      onChanged: (value) {
                        setState(() {
                          currentText =value;
                        });


                      },
                      // beforeTextPaste: (text) {
                      //   return true;
                      // },








                  ),
                ),
              ),
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  hasError ? "* Please enter OTP correctly " : "",
                  style: TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ),


              SizedBox(height: height*0.06),
              SizedBox(
                width: 200.0,
                height: 40.0,
                child: FlatButton(
                  child: Text("Submit",
                  style: TextStyle(fontSize: 20.0),),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                    color: Colors.black38,
                    ),

                    borderRadius: BorderRadius.circular(15.0)),
                  onPressed:() async{

                    formKey.currentState.validate();
                    if(currentText.length != 6 ) {
                      errorController.add(ErrorAnimationType.shake);
                      setState(() {
                        hasError = true ;
                        _codeController.clear();
                      });


                    }
                    else {
                      setState(() {
                        hasError = false ;
                     });
                     final code =currentText;
                      AuthCredential credential = PhoneAuthProvider.getCredential(verificationId: widget.verificationId, smsCode: code);
                      AuthResult result = await _auth.signInWithCredential(credential);
                     FirebaseUser user =result.user;
                     await DatabaseService(uid: user.uid).updateUserData(widget.phone, widget.name,null);
                   if(user != null){


                   Navigator.of(widget.ctx).pushReplacementNamed(HomeScreen.routeName);


                           }







                    }









                  },

                  ),
              ),
              SizedBox(height: height *0.02),

              //FlatButton(

                //child: Text(
                 // "Resend otp",
                  //style: TextStyle(
                   // color: Colors.blue,
                   // decoration: TextDecoration.underline,
                    //fontSize: 20.0,

                  //),),
                  //onPressed: () {


                  //_authverify.loginUser(widget.phone, widget.ctx);

                  //} ,







              //),










            ],
          ),
        ),
      ),





    );
  }
}