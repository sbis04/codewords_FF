import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDf8PKUHZ0-c84WoFzAn-Qn7Eu6KshWH8E",
            authDomain: "codewords-82f6e.firebaseapp.com",
            projectId: "codewords-82f6e",
            storageBucket: "codewords-82f6e.appspot.com",
            messagingSenderId: "82596644495",
            appId: "1:82596644495:web:0e1ab5462831bbfc6f92fa"));
  } else {
    await Firebase.initializeApp();
  }
}
