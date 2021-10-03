import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:administrador_cultivos/correo/enviados.dart';
import 'package:administrador_cultivos/providers/message_provider.dart';
import 'package:administrador_cultivos/correo/recieved_message.dart';

class MailList extends StatelessWidget {
  const MailList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inbox'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Enviados()),
              );
            },
            icon: Icon(Icons.airplane_ticket),
            tooltip: "Mensajes enviados",
          ),
        ],
      ),
      body: ChangeNotifierProvider<MessageProvider>(
        create: (context) => MessageProvider()..getAllMessages(),
        child: Consumer<MessageProvider>(
          builder: (context, messProvider, _) {
            return ListView.builder(
              itemCount: messProvider.getInboxSize,
              itemBuilder: (BuildContext context, int index) {
                return ReceivedMessage(
                  receivedMessage: messProvider.getMessages?.recibidos?[index],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
