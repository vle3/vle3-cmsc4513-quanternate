import 'package:facialrecognitionapp/viewscreen/create_account_screen.dart';
import 'package:facialrecognitionapp/viewscreen/startdispatcher.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const QuanternateApp());
}

class QuanternateApp extends StatelessWidget {
  const QuanternateApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: StartDispatcher.routeName,
      routes: {
        StartDispatcher.routeName: (context) => const StartDispatcher(),
        CreateAccountScreen.routeName: (context) => const CreateAccountScreen(),
      },
    );
  }
}
