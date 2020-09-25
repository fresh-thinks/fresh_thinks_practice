import 'package:cloud_firestore/cloud_firestore.dart';



class DatabaseService {

  final String uid;
  DatabaseService({this.uid});



  final CollectionReference userCollection = Firestore.instance.collection("Users");

  Future updateUserData(String phone,String name,String address) async {

      return await userCollection.document(uid).setData({

        'phoneNumber' : phone,
        'name' : name,
        'address' : address,
     });


}

Future updateData(String key ,String value) async {

  return await userCollection.document(uid).setData({

    key : value,

  });
}


}