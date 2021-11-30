import 'package:administrador_cultivos/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController2 = TextEditingController();
  final TextEditingController passwordController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
            Widget>[
          AppBar(
              automaticallyImplyLeading: false,
              elevation: 0,
              title: Text(
                "Admin cultivos",
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Colors.white,
                      fontSize: 30.0,
                    ),
              ),
              backgroundColor: Colors.green,
              actions: [
                OutlinedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0))),
                            content: Stack(
                              overflow: Overflow.visible,
                              children: <Widget>[
                                Positioned(
                                  right: -40.0,
                                  top: -40.0,
                                  child: InkResponse(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: CircleAvatar(
                                      child: Icon(Icons.close),
                                      backgroundColor: Colors.red,
                                    ),
                                  ),
                                ),
                                Form(
                                  key: _formKey,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          controller: emailController2,
                                          decoration: InputDecoration(
                                            labelText: "Email",
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 3, color: Colors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          controller: passwordController2,
                                          decoration: InputDecoration(
                                            labelText: "Password",
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 3, color: Colors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ElevatedButton(
                                          child: Text("Log-in"),
                                          style: ElevatedButton.styleFrom(
                                              primary: Colors.green,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 50, vertical: 10),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20))),
                                          onPressed: () {
                                            context
                                                .read<AuthenticationService>()
                                                .signIn(
                                                  email: emailController2.text
                                                      .trim(),
                                                  password: passwordController2
                                                      .text
                                                      .trim(),
                                                );
                                            Navigator.pop(context);
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                  },
                  child: Text(
                    "Iniciar sesión",
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                        ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(width: 3.0, color: Colors.white),
                  ),
                ),
              ]),
        ]),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/img/tree-picture.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300.0,
                color: Colors.white,
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.grey),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              Container(
                width: 300.0,
                color: Colors.white,
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: "Password",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.grey),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<AuthenticationService>().signUp(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      );
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.lightGreen,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: Text("Registrarse"),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
