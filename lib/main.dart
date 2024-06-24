import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:task_01/Screens/formscreen.dart';
import 'package:task_01/Screens/formscreen2.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SecFormScreen(),
    );
  }
}
