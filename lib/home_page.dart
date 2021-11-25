// ignore_for_file: prefer_const_constructors

import 'package:administrador_cultivos/detalles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:administrador_cultivos/correo_url.dart';
import 'package:administrador_cultivos/auth_service.dart';
import 'package:administrador_cultivos/collection_manager.dart';

class HomePage extends StatelessWidget {
  final tipoController = TextEditingController();
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
        appBar: AppBar(
          title: Text("Lista de Cultivos"),
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
                                      controller: tipoController,
                                      decoration: InputDecoration(
                                        labelText: "Tipo de arbol a añadir",
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: RaisedButton(
                                      child: Text("Añadir"),
                                      onPressed: () {
                                        context
                                            .read<CollectioManager>()
                                            .agregarArbol(
                                                tipo:
                                                    tipoController.text.trim());
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
              icon: Icon(Icons.library_add),
              tooltip: "Añadir cultivo",
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Mail()),
                );
              },
              icon: Icon(Icons.mail_rounded),
              tooltip: "Enviar Email",
            ),
            IconButton(
              onPressed: () async {
                context.read<AuthenticationService>().signOut();
                //await signUp();
              },
              icon: Icon(Icons.logout),
              tooltip: "Cerrar sesión",
            ),
          ],
        ),
        body: GridView.count(

            // Gridview con 3 cuadros
            crossAxisCount: 3,
            children: List.generate(20, (index) {
              // 20 -> (List.count / 3)
              // Caracteristicas de las tarjetas del Grid
              return Card(
                elevation: 15.0,
                margin: EdgeInsets.all(2.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)),
                child: Align(
                    alignment: Alignment.center,

                    // Contenido de las tarjetas
                    child: Column(
                      children: <Widget>[
                        // Imagen de cultivo
                        Padding(
                          padding: EdgeInsets.all(1.0),
                          child: Image.network(
                            "https://cdn.shopify.com/s/files/1/0326/7189/t/65/assets/pf-e820b2e0--mother-tree-forest.jpg?v=1619557558", // link -> prodsProv.image
                            height: 70.0,
                            width: 90.0,
                            fit: BoxFit.cover,
                          ),
                        ),

                        // SizedBox(
                        //   height: 0.5,
                        // ),

                        // Texto con nombre de cultivo
                        Padding(
                          padding: EdgeInsets.all(1.0),
                          child: TextButton(
                            child: Text(
                              "$index", //"$index" -> prodsProv.name
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.green,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Detalles()));
                            },
                          ),
                        ),
                      ],
                    )),
              );
            })));
  }
}

// ListView.builder(
//             itemCount: 10,
//             itemBuilder: (BuildContext context, int index) {
//               return Text("Pending");
//             },
//           );
