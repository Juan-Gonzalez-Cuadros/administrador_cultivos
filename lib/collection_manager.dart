import 'package:cloud_firestore/cloud_firestore.dart';

class CollectioManager {
  final CollectionReference _arboles;

  CollectioManager(this._arboles);

  Future<void> agregarArbol({required String tipo}) async {
    await _arboles.add({
      'tipo': tipo,
      'estado': true,
      'fecha': DateTime.now(),
      'abono': '',
      'plaga': ''
    });
  }
}
