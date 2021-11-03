import 'package:administrador_cultivos/home_page.dart';
import 'package:flutter/material.dart';

class Detalles extends StatefulWidget {
  Detalles({Key? key}) : super(key: key);

  @override
  _DetallesState createState() => _DetallesState();
}

class _DetallesState extends State<Detalles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalles de Cultivo"),
        backgroundColor: Colors.green,
      ),
    );
  }
}
