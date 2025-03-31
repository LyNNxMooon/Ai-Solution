import 'package:ai_solution/app.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyBtqHejZMNYlheNP2NScdcIr57wbjK1CrY",
        authDomain: "ai-solution-9f81a.firebaseapp.com",
        databaseURL: "https://ai-solution-9f81a-default-rtdb.firebaseio.com",
        projectId: "ai-solution-9f81a",
        storageBucket: "ai-solution-9f81a.firebasestorage.app",
        messagingSenderId: "467152918416",
        appId: "1:467152918416:web:39a6cb4118dfc1ac120515"),
  );
  runApp(MyApp());
}
