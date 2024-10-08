// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
    apiKey: 'AIzaSyD0Izj2BysLkqiPD9JyJr1skjSivdlve-Q',
    appId: '1:150283098127:web:ad69cc6931f5d99da1ab7a',
    messagingSenderId: '150283098127',
    projectId: 'chat-bud-app-80135',
    authDomain: 'chat-bud-app-80135.firebaseapp.com',
    storageBucket: 'chat-bud-app-80135.appspot.com',
    measurementId: 'G-J79FBJFCMT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDa6_XwiTeHWsRP-Ffn_4_FWe4DdqPDSYs',
    appId: '1:150283098127:android:d448aa96dffc37a0a1ab7a',
    messagingSenderId: '150283098127',
    projectId: 'chat-bud-app-80135',
    storageBucket: 'chat-bud-app-80135.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDv4WF6SIX_oTmeYJ-c165X4Co89hMm6XE',
    appId: '1:150283098127:ios:9fdcf4e67729a92ca1ab7a',
    messagingSenderId: '150283098127',
    projectId: 'chat-bud-app-80135',
    storageBucket: 'chat-bud-app-80135.appspot.com',
    iosBundleId: 'com.example.chattingApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDv4WF6SIX_oTmeYJ-c165X4Co89hMm6XE',
    appId: '1:150283098127:ios:9fdcf4e67729a92ca1ab7a',
    messagingSenderId: '150283098127',
    projectId: 'chat-bud-app-80135',
    storageBucket: 'chat-bud-app-80135.appspot.com',
    iosBundleId: 'com.example.chattingApp',
  );
}
