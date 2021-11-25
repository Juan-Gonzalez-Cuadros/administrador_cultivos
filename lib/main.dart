import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:administrador_cultivos/auth_service.dart';
import 'package:administrador_cultivos/sign_up.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:administrador_cultivos/collection_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AuthenticationService>(
            create: (_) => AuthenticationService(FirebaseAuth.instance),
          ),
          Provider<CollectioManager>(
            create: (_) => CollectioManager(
                FirebaseFirestore.instance.collection('arboles')),
          ),
          StreamProvider(
              create: (context) =>
                  context.read<AuthenticationService>().authStateChanges,
              initialData: null),
        ],
        child:
            MaterialApp(title: 'Material App', home: AuthenticationWrapper()));
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      return HomePage();
    }
    return SignUpPage();
  }
}
