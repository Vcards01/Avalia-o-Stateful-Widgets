import 'package:flutter/material.dart';
import '../widgets/media_form.dart';

class MediaCalculatorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de Média'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: MediaForm(),
      ),
    );
  }
}
