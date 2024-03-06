import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCxVnRGk03Pql39xY2BXQNbAQhE7Sm7d3w",
            authDomain: "wticoaches-r94qjv.firebaseapp.com",
            projectId: "wticoaches-r94qjv",
            storageBucket: "wticoaches-r94qjv.appspot.com",
            messagingSenderId: "579815643903",
            appId: "1:579815643903:web:c8e2bfc60028afb4f00aca"));
  } else {
    await Firebase.initializeApp();
  }
}
