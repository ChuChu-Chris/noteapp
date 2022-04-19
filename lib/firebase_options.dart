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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAD7lENqdDUiDNss5kTE_bQpInL2CdDcHk',
    appId: '1:601005020384:web:e8a843787cfa9a9527ec85',
    messagingSenderId: '601005020384',
    projectId: 'noteapp-7e47f',
    authDomain: 'noteapp-7e47f.firebaseapp.com',
    storageBucket: 'noteapp-7e47f.appspot.com',
    measurementId: 'G-GB66QR4XHX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDeGCOZR3xuss92ZjshQYtM0vW6H1bp3Xc',
    appId: '1:601005020384:android:bf724e213f8f97ec27ec85',
    messagingSenderId: '601005020384',
    projectId: 'noteapp-7e47f',
    storageBucket: 'noteapp-7e47f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCP7pFE9y8PJG_rFdOakxgcugg2wTxQZR0',
    appId: '1:601005020384:ios:76a486fff0c6dc9d27ec85',
    messagingSenderId: '601005020384',
    projectId: 'noteapp-7e47f',
    storageBucket: 'noteapp-7e47f.appspot.com',
    iosClientId: '601005020384-ef0rjhelmahupt89nuj1srikbo2v72tf.apps.googleusercontent.com',
    iosBundleId: 'mynoteapp',
  );
}
