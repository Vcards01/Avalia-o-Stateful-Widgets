import 'package:flutter/material.dart';
import 'screens/media_calculator_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de Média',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MediaCalculatorScreen(),
    );
  }
}
