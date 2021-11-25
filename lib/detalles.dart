import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Detalles extends StatelessWidget {
  final data;
  Detalles(this.data);

  @override
  Widget build(BuildContext context) {
    Timestamp t = data['fecha'];
    DateTime d = t.toDate();
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalles de Cultivo"),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: 15.0,
              ),
              Container(
                child: Image.network(data['img']),
              ),
              SizedBox(
                height: 8.0,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Text(
                    "Tipo: " + data['tipo'],
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Activo: " + data['estado'].toString(),
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Fecha: " + d.toString(),
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Abono: " + data['abono'],
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Plaga: " + data['plaga'],
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
