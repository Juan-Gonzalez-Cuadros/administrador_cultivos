import 'package:administrador_cultivos/detalles.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:administrador_cultivos/correo_url.dart';
import 'package:administrador_cultivos/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CollectionReference firebase =
      FirebaseFirestore.instance.collection('arboles');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Lista de Cultivos"),
          backgroundColor: Colors.green,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Mail()),
                );
              },
              icon: Icon(Icons.mail_rounded),
              tooltip: "Enviar Email",
            ),
            RaisedButton(
              onPressed: () async {
                context.read<AuthenticationService>().signOut();
                //await signUp();
              },
              child: Text(
                "Sign Out",
                style: TextStyle(color: Colors.black),
              ),
            ), /*
          RaisedButton(
            onPressed: () async {
              await signIn();
              await checkAuth();
              //await signUp();
            },
            child: Text(
              "Sign In",
              style: TextStyle(color: Colors.black),
            ),
          ),
          RaisedButton(
            onPressed: () async {
              await signUp();
              await checkAuth();
              //await signUp();
            },
            child: Text(
              "Sign Up",
              style: TextStyle(color: Colors.black),
            ),
          ),*/
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
                                  data['id'],
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
