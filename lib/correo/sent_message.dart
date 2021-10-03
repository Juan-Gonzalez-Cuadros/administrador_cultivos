import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:administrador_cultivos/models/enviado.dart';

class SentMessage extends StatelessWidget {
  final Enviado? sentMessage;
  const SentMessage({
    Key? key,
    @required this.sentMessage,
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
                    "${sentMessage?.asunto}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    "${sentMessage?.contenido}",
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
