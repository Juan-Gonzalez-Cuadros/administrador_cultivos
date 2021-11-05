// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:administrador_cultivos/correo/inbox.dart';
import 'package:administrador_cultivos/correo_url.dart';

import 'providers/detalles_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Cultivos"),
        backgroundColor: Colors.green,
        actions: [
          /*IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => MailList()),
              );
            },
            icon: Icon(Icons.mail),
            tooltip: "Correo",
          ),*/
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Mail()),
              );
            },
            icon: Icon(Icons.mail_rounded),
            tooltip: "Enviar Email",
          ),
        ],
      ),
      body: Consumer<DetallesProvider>(
        builder: (context, prodsProv, child) {
          return GridView.count(

              // Gridview con 3 cuadros
              crossAxisCount: 3,
              children: List.generate(30, (index) {
                // 30 -> (List.count / 3)
                // Caracteristicas de las tarjetas del Grid
                return Card(
                  elevation: 10.0,
                  margin: EdgeInsets.all(8.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Align(
                      alignment: Alignment.center,

                      // Contenido de las tarjetas
                      child: Column(
                        children: <Widget>[
                          // Imagen de cultivo
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Image.network(
                              "https://cdn.shopify.com/s/files/1/0326/7189/t/65/assets/pf-e820b2e0--mother-tree-forest.jpg?v=1619557558", // link -> prodsProv.image
                              height: 100.0,
                              width: 100.0,
                              fit: BoxFit.cover,
                            ),
                          ),

                          SizedBox(
                            height: 5.0,
                          ),

                          // Texto con nombre de cultivo
                          Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Text(
                              "$index", //"$index" -> prodsProv.name
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ],
                      )),
                );
              }));
        },
      ),
    );
  }
}

// ListView.builder(
//             itemCount: 10,
//             itemBuilder: (BuildContext context, int index) {
//               return Text("Pending");
//             },
//           );