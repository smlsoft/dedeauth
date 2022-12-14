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
    apiKey: 'AIzaSyBqdwdNWmKEjBrHkcmjjNPKwC4wpEHt-4o',
    appId: '1:748302077444:web:f78588c699929ac443ef51',
    messagingSenderId: '748302077444',
    projectId: 'thai7-5d3ee',
    authDomain: 'thai7-5d3ee.firebaseapp.com',
    storageBucket: 'thai7-5d3ee.appspot.com',
    measurementId: 'G-EP9JTFD0NT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBWC-G2mVfqE1IN7QYgyFONfB05wvi8Xho',
    appId: '1:748302077444:android:adf2cd672487d90b43ef51',
    messagingSenderId: '748302077444',
    projectId: 'thai7-5d3ee',
    storageBucket: 'thai7-5d3ee.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAkRyeKdHM7C3dQ4Xr043Ier3KF-G9FHNI',
    appId: '1:748302077444:ios:0b2cebf63f8f58a143ef51',
    messagingSenderId: '748302077444',
    projectId: 'thai7-5d3ee',
    storageBucket: 'thai7-5d3ee.appspot.com',
    androidClientId:
        '748302077444-i608cdt8s2rus12vb6vtq9kb543088pf.apps.googleusercontent.com',
    iosClientId:
        '748302077444-ra44o1tjsmhbbglpos38s4kq4df20nhh.apps.googleusercontent.com',
    iosBundleId: 'com.smlsoft.dedeauth',
  );
}
