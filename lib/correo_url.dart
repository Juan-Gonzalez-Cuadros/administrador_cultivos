import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
  TextEditingController emailController2 = TextEditingController();
  TextEditingController emailController3 = TextEditingController();

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
              hintText: 'Contacto',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Introduzca algo de texto';
              }
              return null;
            },
          ),
          TextFormField(
            controller: emailController2,
            decoration: const InputDecoration(
              hintText: 'Asunto',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Introduzca algo de texto';
              }
              return null;
            },
          ),
          TextFormField(
            controller: emailController3,
            decoration: const InputDecoration(
              hintText: 'Mensaje',
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
                launch(('mailto:' +
                    emailController.text +
                    '?subject=' +
                    emailController2.text +
                    '&body=' +
                    emailController3.text));
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                /*if (_formKey.currentState!.validate()) {
                  // Process data.
                  //print(emailController.text);
                  Utils.openEmail(
                    toEmail: emailController.text,
                    subject: emailController2.text,
                    body: emailController3.text,
                  );
                }*/
              },
              child: const Text('Abrir Email'),
            ),
          ),
        ],
      ),
    );
  }
}
