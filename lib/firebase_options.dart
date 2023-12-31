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
    apiKey: 'AIzaSyBp34J6TzR8iJsJXS9UN73p2i3bd1xFXRw',
    appId: '1:876603475296:web:5ee4b717d88d4c94e40a05',
    messagingSenderId: '876603475296',
    projectId: 'ecoapp-d5492',
    authDomain: 'ecoapp-d5492.firebaseapp.com',
    storageBucket: 'ecoapp-d5492.appspot.com',
    measurementId: 'G-6F5KRWT3EE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAdiCmFjkP0sl7S-GBhu0UiWeNkpe8spMo',
    appId: '1:876603475296:android:cbcd383ab6311456e40a05',
    messagingSenderId: '876603475296',
    projectId: 'ecoapp-d5492',
    storageBucket: 'ecoapp-d5492.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAFGjv8J_qWoYGU34Zz9xJukhWgH0923ak',
    appId: '1:876603475296:ios:4db735e567a26346e40a05',
    messagingSenderId: '876603475296',
    projectId: 'ecoapp-d5492',
    storageBucket: 'ecoapp-d5492.appspot.com',
    iosClientId: '876603475296-5pvfddgafpgh9dg89tbii0ubj18vmkko.apps.googleusercontent.com',
    iosBundleId: 'com.example.eccoApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAFGjv8J_qWoYGU34Zz9xJukhWgH0923ak',
    appId: '1:876603475296:ios:4db735e567a26346e40a05',
    messagingSenderId: '876603475296',
    projectId: 'ecoapp-d5492',
    storageBucket: 'ecoapp-d5492.appspot.com',
    iosClientId: '876603475296-5pvfddgafpgh9dg89tbii0ubj18vmkko.apps.googleusercontent.com',
    iosBundleId: 'com.example.eccoApp',
  );
}
