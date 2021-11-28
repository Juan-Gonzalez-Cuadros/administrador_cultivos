import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CollectioManager {
  final CollectionReference _arboles;

  CollectioManager(this._arboles);

  Future<void> agregarArbol({required String tipo, required String img}) async {
    QuerySnapshot productCollection =
        await FirebaseFirestore.instance.collection('arboles').get();
    int productCount = productCollection.size;

    DocumentReference<Map<String, dynamic>> arboles = FirebaseFirestore.instance
        .collection('/arboles')
        .doc(productCount.toString());
    var myJSONObj = {
      'tipo': tipo,
      'estado': true,
      'fecha': DateTime.now(),
      'abono': '',
      'plaga': '',
      'id': productCount,
      'img': img,
      'user': FirebaseAuth.instance.currentUser!.uid
    };
    arboles
        .set(myJSONObj)
        .then((value) => print("Document with CustomID added"))
        .catchError((error) => print("Failed to add document: $error"));
  }

  Future<void> actualizarArbol(
      {required String id,
      required String estado,
      required String abono,
      required String plaga,
      required String img,
      required String tipo}) async {
    bool b = estado.toLowerCase() == 'true';
    DocumentReference<Map<String, dynamic>> arboles =
        FirebaseFirestore.instance.collection('/arboles').doc(id);
    var myJSONObj = {
      'tipo': tipo,
      'estado': b,
      'fecha': DateTime.now(),
      'abono': abono,
      'plaga': plaga,
      'id': id,
      'img': img
    };
    arboles
        .set(myJSONObj)
        .then((value) => print("Document updated"))
        .catchError((error) => print("Failed to update document: $error"));
  }
}
