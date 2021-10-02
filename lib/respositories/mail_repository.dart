import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:administrador_cultivos/models/m_sent.dart';
import 'package:administrador_cultivos/models/messages.dart';

class MailRepository {
  // singleton
  static final MailRepository _MailRepository = MailRepository._internal();
  factory MailRepository() {
    return _MailRepository;
  }

  MailRepository._internal();
  final String baseUrl =
      "https://api.sheety.co/2899a41a1c8742591281bfb55c9b64d7/mensajes/";

  Future<Messages?> getMessages(String resource) async {
    try {
      Response response = await get(Uri.parse(baseUrl + resource));
      if (response.statusCode == HttpStatus.ok) {
        Messages messages = Messages.fromJson(await jsonDecode(response.body));
        return messages;
      } else {
        return null;
      }
    } on Exception catch (ex, stackTrace) {
      print("ERROR: $resource>> ${ex.toString()}\n${stackTrace.toString()}");
      return null;
    }
  }

  Future<MSent?> getMSent(String resource) async {
    try {
      Response response = await get(Uri.parse(baseUrl + resource));
      if (response.statusCode == HttpStatus.ok) {
        MSent sent = MSent.fromJson(await jsonDecode(response.body));
        return sent;
      } else {
        return null;
      }
    } on Exception catch (ex, stackTrace) {
      print("ERROR: $resource>> ${ex.toString()}\n${stackTrace.toString()}");
      return null;
    }
  }

  Future<String> receive(String resource, Messages messages) async {
    try {
      Response response = await post(
        Uri.parse(baseUrl + resource),
        body: {
          messages.toJson(),
        },
      );
      if (response.statusCode == HttpStatus.ok) {
        return "Se recibio mensaje nuevo";
      } else {
        return "Ha ocurrido un error al recibir mensaje: ${response.statusCode}";
      }
    } on Exception catch (ex, stackTrace) {
      print("ERROR: $resource>> ${ex.toString()}\n${stackTrace.toString()}");
      return "Ha ocurrido un error desconocido";
    }
  }

  Future<String> send(String resource, MSent sent) async {
    try {
      Response response = await post(
        Uri.parse(baseUrl + resource),
        body: {
          sent.toJson(),
        },
      );
      if (response.statusCode == HttpStatus.ok) {
        return "Se envio el mensaje";
      } else {
        return "Ha ocurrido un error al enviar mensaje: ${response.statusCode}";
      }
    } on Exception catch (ex, stackTrace) {
      print("ERROR: $resource>> ${ex.toString()}\n${stackTrace.toString()}");
      return "Ha ocurrido un error desconocido";
    }
  }
}
