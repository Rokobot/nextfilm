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
    apiKey: 'AIzaSyDXFRmflgEXMb5CmlonCUHBKcR7B6CajzI',
    appId: '1:543272945084:web:b4777e6599be7e3e2557b9',
    messagingSenderId: '543272945084',
    projectId: 'nextfilm-23cf7',
    authDomain: 'nextfilm-23cf7.firebaseapp.com',
    storageBucket: 'nextfilm-23cf7.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAsR-eJHlDEa64p6twhL3_eyhj9MNJ4jCg',
    appId: '1:543272945084:android:5b99040fb78819b22557b9',
    messagingSenderId: '543272945084',
    projectId: 'nextfilm-23cf7',
    storageBucket: 'nextfilm-23cf7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCocfUuy6rNRSJOugR8tPBDYj0GwR668yg',
    appId: '1:543272945084:ios:8ce5c95bd09bc8fa2557b9',
    messagingSenderId: '543272945084',
    projectId: 'nextfilm-23cf7',
    storageBucket: 'nextfilm-23cf7.appspot.com',
    iosBundleId: 'com.example.nextfilm',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCocfUuy6rNRSJOugR8tPBDYj0GwR668yg',
    appId: '1:543272945084:ios:96d7b4ce779f44272557b9',
    messagingSenderId: '543272945084',
    projectId: 'nextfilm-23cf7',
    storageBucket: 'nextfilm-23cf7.appspot.com',
    iosBundleId: 'com.example.nextfilm.RunnerTests',
  );
}