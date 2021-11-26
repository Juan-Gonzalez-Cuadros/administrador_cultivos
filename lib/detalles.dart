import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:administrador_cultivos/collection_manager.dart';
import 'package:provider/provider.dart';

class Detalles extends StatelessWidget {
  final data;
  Detalles(this.data);

  @override
  Widget build(BuildContext context) {
    TextEditingController estadoController =
        TextEditingController(text: data['estado'].toString());
    TextEditingController abonoController =
        TextEditingController(text: data['abono'].toString());
    TextEditingController plagaController =
        TextEditingController(text: data['plaga'].toString());
    TextEditingController imgController =
        TextEditingController(text: data['img'].toString());
    TextEditingController tipoController =
        TextEditingController(text: data['tipo'].toString());

    final _formKey = GlobalKey<FormState>();
    Timestamp t = data['fecha'];
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
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: abonoController,
                                    decoration: InputDecoration(
                                      labelText: "Abono",
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: plagaController,
                                    decoration: InputDecoration(
                                      labelText: "Plaga",
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: imgController,
                                    decoration: InputDecoration(
                                      labelText: "Url de imagen",
                                    ),
                                  ),
                                ),
                                /*Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: tipoController,
                                    decoration: InputDecoration(
                                      labelText: "Tipo",
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
                                            id: data['id'].toString(),
                                            estado: estadoController.text,
                                            abono: abonoController.text,
                                            plaga: plagaController.text,
                                            img: imgController.text,
                                            tipo: tipoController.text,
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
