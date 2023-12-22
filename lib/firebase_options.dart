import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyCXiO3cddL2yfQH2lD_CESljGjcjxc8cDc',
    appId: '1:531698260487:web:6ba60d8496cee9fca728a2',
    messagingSenderId: '531698260487',
    projectId: 'chat-app-23310',
    authDomain: 'chat-app-23310.firebaseapp.com',
    databaseURL: 'https://chat-app-23310-default-rtdb.firebaseio.com',
    storageBucket: 'chat-app-23310.appspot.com',
    measurementId: 'G-282LHTQHC9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAV8pRI2xh4qtMA4NY9BHPDlLj17CGUa0s',
    appId: '1:531698260487:android:f514aa17e6e7befca728a2',
    messagingSenderId: '531698260487',
    projectId: 'chat-app-23310',
    databaseURL: 'https://chat-app-23310-default-rtdb.firebaseio.com',
    storageBucket: 'chat-app-23310.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBTSV8uO0V1AVf2fC-v6fVynn3nSCaOpK4',
    appId: '1:531698260487:ios:0f11695e341f47a7a728a2',
    messagingSenderId: '531698260487',
    projectId: 'chat-app-23310',
    databaseURL: 'https://chat-app-23310-default-rtdb.firebaseio.com',
    storageBucket: 'chat-app-23310.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBTSV8uO0V1AVf2fC-v6fVynn3nSCaOpK4',
    appId: '1:531698260487:ios:283c0cf98a41f074a728a2',
    messagingSenderId: '531698260487',
    projectId: 'chat-app-23310',
    databaseURL: 'https://chat-app-23310-default-rtdb.firebaseio.com',
    storageBucket: 'chat-app-23310.appspot.com',
    iosBundleId: 'com.example.chatApp.RunnerTests',
  );
}
