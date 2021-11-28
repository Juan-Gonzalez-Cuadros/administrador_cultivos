import 'package:administrador_cultivos/detalles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:administrador_cultivos/correo_url.dart';
import 'package:administrador_cultivos/auth_service.dart';
import 'package:administrador_cultivos/collection_manager.dart';
import 'package:administrador_cultivos/image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String imageUrl = '';
  final tipoController = TextEditingController();
  final Query<Map<String, dynamic>> firebase =
      FirebaseFirestore.instance.collection('arboles').orderBy('id');
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
                                    padding: EdgeInsets.all(8.0),
                                    child: TreeImage(
                                      onFileChanged: (imageUrl) {
                                        setState(() {
                                          this.imageUrl = imageUrl;
                                        });
                                      },
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
        body: StreamBuilder(
          stream: firebase.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              );
            }

            return GridView.count(
              crossAxisCount: 3,
              children: snapshot.data!.docs.map((data) {
                return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Detalles(data)));
                    },
                    child: Card(
                      elevation: 15.0,
                      margin: EdgeInsets.all(2.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0)),
                      child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(1.0),
                                child: Image.network(
                                  data['img'],
                                  height: 100.0,
                                  width: 100.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(1.0),
                                child: Text(
                                  data['id'].toString() + ": " + data['tipo'],
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ));
              }).toList(),
            );
          },
        ));
  }
}
