import 'package:administrador_cultivos/detalles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:administrador_cultivos/correo_url.dart';
import 'package:administrador_cultivos/auth_service.dart';
import 'package:administrador_cultivos/image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String imageUrl =
      'https://cdn.shopify.com/s/files/1/0326/7189/t/65/assets/pf-e820b2e0--mother-tree-forest.jpg?v=1619557558';
  final Query<Map<String, dynamic>> firebase = FirebaseFirestore.instance
      .collection('arboles')
      .where('user', isEqualTo: FirebaseAuth.instance.currentUser!.uid);
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
        resizeToAvoidBottomInset: false,
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
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0))),
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
                              child: TreeImage(
                                onFileChanged: (imageUrl) {
                                  setState(() {
                                    this.imageUrl = imageUrl;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              },
              icon: Icon(Icons.library_add),
              tooltip: "A??adir cultivo",
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
              tooltip: "Cerrar sesi??n",
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/img/sheets-picture.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: StreamBuilder(
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
                                builder: (context) => Detalles(data: data)));
                      },
                      child: Card(
                        elevation: 15.0,
                        margin: EdgeInsets.all(1.0),
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0)),
                        child: Align(
                            alignment: Alignment.center,
                            child: Column(
                              children: <Widget>[
                                AspectRatio(
                                  child: Image.network(
                                    data['img'],
                                    height: 100.0,
                                    width: 125.0,
                                    fit: BoxFit.cover,
                                  ),
                                  aspectRatio: 2 / 1,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(1.0),
                                  child: Text(
                                    data['tipo'],
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ));
                }).toList(),
              );
            },
          ),
        ));
  }
}
