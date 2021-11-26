import 'package:cloud_firestore/cloud_firestore.dart';

class CollectioManager {
  final CollectionReference _arboles;

  CollectioManager(this._arboles);

  Future<void> agregarArbol({required String tipo}) async {
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
      'img':
          'https://cdn.shopify.com/s/files/1/0326/7189/t/65/assets/pf-e820b2e0--mother-tree-forest.jpg?v=1619557558'
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
