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
    apiKey: 'AIzaSyCM3BvxScGvvm5B2-BzohQ6bV5L5PV18fA',
    appId: '1:80481143259:web:c2221fec7befa3665e7ffe',
    messagingSenderId: '80481143259',
    projectId: 'myapp-98dbf',
    authDomain: 'myapp-98dbf.firebaseapp.com',
    storageBucket: 'myapp-98dbf.appspot.com',
    measurementId: 'G-60Q88TFBXR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBqzezkiSm5Ie9EgS7vQJzIW6sacZ4NoEY',
    appId: '1:80481143259:android:d91273da28e2494e5e7ffe',
    messagingSenderId: '80481143259',
    projectId: 'myapp-98dbf',
    storageBucket: 'myapp-98dbf.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCAOjVAxKaFmKz9OkJMgRXwqnNtEzMFRMo',
    appId: '1:80481143259:ios:61f7552e7ef156db5e7ffe',
    messagingSenderId: '80481143259',
    projectId: 'myapp-98dbf',
    storageBucket: 'myapp-98dbf.appspot.com',
    iosClientId: '80481143259-4b5t5js1nfdhelh09nbp2ut0ptdobhrj.apps.googleusercontent.com',
    iosBundleId: 'com.joudalmahdi.myapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCAOjVAxKaFmKz9OkJMgRXwqnNtEzMFRMo',
    appId: '1:80481143259:ios:db203b3e431326eb5e7ffe',
    messagingSenderId: '80481143259',
    projectId: 'myapp-98dbf',
    storageBucket: 'myapp-98dbf.appspot.com',
    iosClientId: '80481143259-8mumftoi6qlj8tl8rafkgmjjnli1gm3m.apps.googleusercontent.com',
    iosBundleId: 'com.example.myapp',
  );
}
