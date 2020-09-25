import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


Future<void> editProduct(bool _isFavourite,String id) async {
  await Firestore.instance
      .collection("Products")
      .document(id)
      .updateData({"isFavourite": !_isFavourite});
}

Future<String> getUid() async{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user = await _auth.currentUser();
  return (user.uid);
}

Future<DocumentReference> getDocId() async {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;
  FirebaseUser user = await _auth.currentUser();
  DocumentReference ref = _firestore.collection('Favorites').document(user.uid);
  return ref;
}

Future<bool> checkIfDocExists(String docId) async {
  try {
    // Get reference to Firestore collection
    var collectionRef = Firestore.instance.collection('Favorites');
    var doc = await collectionRef.document(docId).get();
    return doc.exists;
  } catch (e) {
    throw e;
  }
}

Future<void> uploadingData(String _productName, String _productPrice,
    String _imageUrl, bool _isFavourite,String docId) async {
  await Firestore.instance.collection("Favorites").document(docId).setData({
    'productName': _productName,
    'productPrice': _productPrice,
    'imageUrl': _imageUrl,
    'isFavourite': _isFavourite,
  }, merge: true);
}



