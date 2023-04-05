import 'package:facialrecognitionapp/model/photomemo.dart';
import 'package:facialrecognitionapp/viewscreen/create_account_screen.dart';
import 'package:facialrecognitionapp/viewscreen/detailview_screen.dart';
import 'package:facialrecognitionapp/viewscreen/startdispatcher.dart';
import 'package:facialrecognitionapp/viewscreen/view/changepassword_screen.dart';
import 'package:facialrecognitionapp/viewscreen/view/createphotomemo_screen.dart';
import 'package:facialrecognitionapp/viewscreen/view/editprofile_screen.dart';
import 'package:facialrecognitionapp/viewscreen/view/error_screen.dart';
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
        CreatePhotoMemoScreen.routeName: (context) =>
            const CreatePhotoMemoScreen(),
        DetailViewScreen.routeName: (context) {
          Object? args = ModalRoute.of(context)?.settings.arguments;
          if (args == null) {
            return const ErrorScreen('arg is null from HomeScreen');
          } else {
            var photoMemo = args as PhotoMemo;
            return DetailViewScreen(photoMemo: photoMemo);
          }
        },
        ChangePasswordScreen.routeName: (context) =>
            const ChangePasswordScreen(),
        EditProfileScreen.routeName: (context) => const EditProfileScreen(),
      },
    );
  }
}
