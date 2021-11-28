import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:administrador_cultivos/update_image.dart';

class Detalles extends StatefulWidget {
  final data;

  Detalles({required this.data});

  @override
  State<Detalles> createState() => _DetallesState();
}

class _DetallesState extends State<Detalles> {
  String imageUrl = '';
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    Timestamp t = widget.data['fecha'];
    DateTime d = t.toDate();

    return Scaffold(
      appBar: AppBar(
        title: Text("Detalles de Cultivo"),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Stack(
                        overflow: Overflow.visible,
                        children: <Widget>[
                          Positioned(
                            right: -40.0,
                            top: -40.0,
                            child: InkResponse(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: CircleAvatar(
                                child: Icon(Icons.close),
                                backgroundColor: Colors.red,
                              ),
                            ),
                          ),
                          Form(
                            key: _formKey,
                            child: UpdateTreeImage(
                                onFileChanged: (imageUrl) {
                                  setState(() {
                                    this.imageUrl = imageUrl;
                                  });
                                },
                                data: widget.data),
                          ),
                        ],
                      ),
                    );
                  });
              setState(() {});
            },
            icon: Icon(Icons.edit),
            tooltip: "Actualizar arbol",
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: 15.0,
              ),
              Container(
                child: Image.network(widget.data['img']),
              ),
              SizedBox(
                height: 8.0,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Text(
                    "Tipo: " + widget.data['tipo'],
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
                  "Activo: " + widget.data['estado'].toString(),
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
                  "Abono: " + widget.data['abono'],
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Plaga: " + widget.data['plaga'],
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
