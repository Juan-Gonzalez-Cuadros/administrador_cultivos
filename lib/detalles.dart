// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:administrador_cultivos/collection_manager.dart';
import 'package:provider/provider.dart';

class Detalles extends StatefulWidget {
  Detalles({Key? key}) : super(key: key);

  @override
  _DetallesState createState() => _DetallesState();
}

class _DetallesState extends State<Detalles> {
  final TextEditingController estadoController =
      TextEditingController(text: "true");
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
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
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: estadoController,
                                    decoration: InputDecoration(
                                      labelText: "Estado",
                                    ),
                                  ),
                                ),
                                /*Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: passwordController2,
                                      decoration: InputDecoration(
                                        labelText: "Password",
                                      ),
                                    ),
                                  ),*/
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: RaisedButton(
                                    child: Text("Actualizar"),
                                    onPressed: () {
                                      context
                                          .read<CollectioManager>()
                                          .actualizarArbol(
                                            id: '5',
                                            estado: estadoController.text,
                                          );
                                      Navigator.pop(context);
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            },
            icon: Icon(Icons.edit),
            tooltip: "Actualizar arbol",
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            //<Widget>
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  //image: DecorationImage(image: AssetImage("prodsProv.image")),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                //child: ListTile{
                child: Column(
                  //title:
                  children: [
                    //<Widget>
                    Text(
                      "Planta",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                //},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
