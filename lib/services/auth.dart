import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fresh_thinks_practice/screens/code_screen.dart';

import 'package:fresh_thinks_practice/screens/locationCheck.dart';
import 'package:fresh_thinks_practice/services/database.dart';



class AuthService {
  bool login=false;
  bool register=true;
  bool otp=false;
  final name;
  AuthService({this.name});


  final FirebaseAuth _auth = FirebaseAuth.instance;








  Future <bool>  loginUser(String phone,BuildContext context) async {

 await  _auth.verifyPhoneNumber(
    phoneNumber: phone,
    timeout: Duration(seconds: 60),
    verificationCompleted: (AuthCredential credential) async {


      AuthResult result = await _auth.signInWithCredential(credential);
      FirebaseUser user = result.user;
      await DatabaseService(uid: user.uid).updateUserData(phone, name,null);

       if(user != null){

        Navigator.of(context).push(MaterialPageRoute(builder: (context) => LocationCheck()));

        }
    },
    verificationFailed: (AuthException exception){


           print(exception);




    },

    codeSent: (String verificationId, [int forceResendingToken]) {



           Navigator.of(context).push(
             MaterialPageRoute(
                   builder: (_) => CodeScreen(ctx: context,verificationId: verificationId,phone: phone,name: name),
           )
           );

    },

    codeAutoRetrievalTimeout: null,

    );

}



Future signOut()  async {
  try {

    return await _auth.signOut();

  } catch(e) {
      print(e.toString());
      return null;

  }
}



}