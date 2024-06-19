import 'package:flutter/material.dart';
import 'package:task_01/Screens/formscreen.dart';
import 'package:task_01/Screens/formscreen2.dart';

void main() {
  runApp(const MainApp());
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
