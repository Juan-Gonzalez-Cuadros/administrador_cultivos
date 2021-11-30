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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              hintText: 'Contacto',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.grey),
                borderRadius: BorderRadius.circular(15),
              ),
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
            decoration: InputDecoration(
              hintText: 'Asunto',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.grey),
                borderRadius: BorderRadius.circular(15),
              ),
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
            decoration: InputDecoration(
              hintText: 'Mensaje',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.grey),
                borderRadius: BorderRadius.circular(15),
              ),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      launch(('mailto:' +
                          emailController.text +
                          '?subject=' +
                          emailController2.text +
                          '&body=' +
                          emailController3.text));
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.lightGreen,
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: const Text('Abrir Email'),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
