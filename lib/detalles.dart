// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
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
