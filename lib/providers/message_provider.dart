import 'package:flutter/cupertino.dart';
import 'package:administrador_cultivos/models/m_sent.dart';
import 'package:administrador_cultivos/models/messages.dart';
import 'package:administrador_cultivos/respositories/mail_repository.dart';

class MessageProvider with ChangeNotifier {
  Messages? _messagesData;
  Messages? get getMessages => _messagesData;

  MSent? _sentData;
  MSent? get getMSent => _sentData;

  int? get getInboxSize => _messagesData?.recibidos?.length;
  int? get getSentSize => _sentData?.enviados?.length;

  Future getAllMessages() async {
    _messagesData = await MailRepository().getMessages("recibidos");
    notifyListeners();
  }

  Future getSentMessages() async {
    _sentData = await MailRepository().getMSent("enviados");
    notifyListeners();
  }
}
