import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:administrador_cultivos/models/recibido.dart';

class ReceivedMessage extends StatelessWidget {
  final Recibido? receivedMessage;
  const ReceivedMessage({
    Key? key,
    @required this.receivedMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(12),
      child: Row(
        children: [
          /*ClipRRect(
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(5),
              topLeft: Radius.circular(5),
            ),
            child: Image.network(
              "${receivedMessage?.asunto}",
              width: 120,
            ),
          ),*/
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${receivedMessage?.asunto}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    "${receivedMessage?.contenido}",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
          ),
          /*IconButton(
            onPressed: () {},
            icon: Icon(Icons.add_shopping_cart),
            tooltip: "Agregar al carrito",
          )*/
        ],
      ),
    );
  }
}
