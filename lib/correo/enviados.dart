import 'package:provider/provider.dart';
import 'package:administrador_cultivos/providers/message_provider.dart';
import 'package:administrador_cultivos/correo/sent_message.dart';
//import 'package:proyecto/models/enviado.dart';
import 'package:flutter/material.dart';

class Enviados extends StatefulWidget {
  Enviados({Key? key}) : super(key: key);

  @override
  _EnviadosState createState() => _EnviadosState();
}

class _EnviadosState extends State<Enviados> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mensajes Enviados"),
      ),
      body: ChangeNotifierProvider<MessageProvider>(
        create: (context) => MessageProvider()..getSentMessages(),
        child: Consumer<MessageProvider>(
          builder: (context, messProvider, _) {
            return ListView.builder(
              itemCount: messProvider.getSentSize,
              itemBuilder: (BuildContext context, int index) {
                return SentMessage(
                  sentMessage: messProvider.getMSent?.enviados?[index],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
