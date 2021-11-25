import 'package:flutter/material.dart';
import 'package:administrador_cultivos/utils.dart';

void main() => runApp(const Mail());

class Mail extends StatelessWidget {
  const Mail({Key? key}) : super(key: key);

  static const String _title = 'Enviar correo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(_title),
          backgroundColor: Colors.green,
        ),
        body: const MailPage(),
      ),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MailPage extends StatefulWidget {
  const MailPage({Key? key}) : super(key: key);

  @override
  State<MailPage> createState() => _MailPageState();
}

class _MailPageState extends State<MailPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              hintText: 'Introduzca el contacto',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Introduzca algo de texto';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState!.validate()) {
                  // Process data.
                  //print(emailController.text);
                  Utils.openEmail(
                    toEmail: emailController.text,
                    subject: '',
                    body: '',
                  );
                }
              },
              child: const Text('Abrir Email'),
            ),
          ),
        ],
      ),
    );
  }
}

  /*Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildButton(
                text: 'Open Link',
                onClicked: () => Utils.openLink(url: 'http://flutter.dev'),
              ),
              buildButton(
                text: 'Open Email',
                onClicked: () => Utils.openEmail(
                  toEmail: 'example@gmail.com',
                  subject: 'Hello World',
                  body: 'This works great!',
                ),
              ),
              buildButton(
                text: 'Open Call',
                onClicked: () =>
                    Utils.openPhoneCall(phoneNumber: '+4912388128311'),
              ),
              buildButton(
                text: 'Open SMS',
                onClicked: () => Utils.openSMS(phoneNumber: '+4912388128311'),
              ),
            ],
          ),
        ),
      );
  Widget buildButton({
    required String text,
    required VoidCallback onClicked,
  }) =>
      Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: RaisedButton(
          shape: StadiumBorder(),
          onPressed: onClicked,
          color: Colors.red,
          textColor: Colors.white,
          child: Text(
            text,
            style: TextStyle(fontSize: 24),
          ),
        ),
      );
}*/