import 'package:cloud_firestore/cloud_firestore.dart';

class CollectioManager {
  final CollectionReference _arboles;

  CollectioManager(this._arboles);

  Future<void> agregarArbol({required String tipo}) async {
    QuerySnapshot productCollection =
        await FirebaseFirestore.instance.collection('arboles').get();
    int productCount = productCollection.size;
    await _arboles.add({
      'tipo': tipo,
      'estado': true,
      'fecha': DateTime.now(),
      'abono': '',
      'plaga': '',
      'id': productCount,
      'img': ''
    });
  }
}
