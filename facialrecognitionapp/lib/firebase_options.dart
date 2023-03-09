// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDvEyRAElrxtDkX_boSPtazdAHAROTwNyU',
    appId: '1:491718557805:web:97d85bbf8cd3949801bf64',
    messagingSenderId: '491718557805',
    projectId: 'quanternate',
    authDomain: 'quanternate.firebaseapp.com',
    databaseURL: 'https://quanternate-default-rtdb.firebaseio.com',
    storageBucket: 'quanternate.appspot.com',
    measurementId: 'G-HR4RFY4VSY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDGCwaljMxbpQdwYGTEhgdUrKOMIyoVjvU',
    appId: '1:491718557805:android:8f1a4804a8ff7a8801bf64',
    messagingSenderId: '491718557805',
    projectId: 'quanternate',
    databaseURL: 'https://quanternate-default-rtdb.firebaseio.com',
    storageBucket: 'quanternate.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCDlMkCd97-Ysb8jpezQad4-5CASJdu12c',
    appId: '1:491718557805:ios:488ae514d40f486401bf64',
    messagingSenderId: '491718557805',
    projectId: 'quanternate',
    databaseURL: 'https://quanternate-default-rtdb.firebaseio.com',
    storageBucket: 'quanternate.appspot.com',
    iosClientId: '491718557805-h5voem1s8a5tvddbmsavpn8eifp17r5j.apps.googleusercontent.com',
    iosBundleId: 'edu.uco.vle3.cmsc4513.facialrecognitionapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCDlMkCd97-Ysb8jpezQad4-5CASJdu12c',
    appId: '1:491718557805:ios:488ae514d40f486401bf64',
    messagingSenderId: '491718557805',
    projectId: 'quanternate',
    databaseURL: 'https://quanternate-default-rtdb.firebaseio.com',
    storageBucket: 'quanternate.appspot.com',
    iosClientId: '491718557805-h5voem1s8a5tvddbmsavpn8eifp17r5j.apps.googleusercontent.com',
    iosBundleId: 'edu.uco.vle3.cmsc4513.facialrecognitionapp',
  );
}
