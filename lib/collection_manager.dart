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
      'img':
          'https://cdn.shopify.com/s/files/1/0326/7189/t/65/assets/pf-e820b2e0--mother-tree-forest.jpg?v=1619557558'
    });
  }
}
