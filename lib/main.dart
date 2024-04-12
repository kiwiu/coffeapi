import 'package:flutter/material.dart';
import 'package:coffeapi/view/coffeall.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Coffeall()
    );
  }
}
