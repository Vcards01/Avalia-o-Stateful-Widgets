import 'package:flutter/material.dart';

class MediaForm extends StatefulWidget {
  @override
  _MediaFormState createState() => _MediaFormState();
}

class _MediaFormState extends State<MediaForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nota1Controller = TextEditingController();
  final TextEditingController _nota2Controller = TextEditingController();
  final TextEditingController _nota3Controller = TextEditingController();

  double? _media;

  void _calculaMedia() {
    final nota1 = double.tryParse(_nota1Controller.text);
    final nota2 = double.tryParse(_nota2Controller.text);
    final nota3 = double.tryParse(_nota3Controller.text);

    if (nota1 != null && nota2 != null && nota3 != null) {
      setState(() {
        _media = (nota1 + nota2 + nota3) / 3;
      });
    }
  }

  void _limpaCampos() {
    setState(() {
      _nameController.clear();
      _emailController.clear();
      _nota1Controller.clear();
      _nota2Controller.clear();
      _nota3Controller.clear();
      _media = null;
    });
  }

  void _removeFocus() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _removeFocus,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _nota1Controller,
                    decoration: InputDecoration(labelText: 'Nota 1'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _nota2Controller,
                    decoration: InputDecoration(labelText: 'Nota 2'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _nota3Controller,
                    decoration: InputDecoration(labelText: 'Nota 3'),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _calculaMedia,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Color(0xFF2395F1),
                ),
                child: Text('Calcular Média'),
              ),
            ),
            SizedBox(height: 20),
            Text('Resultado:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Nome: ${_nameController.text}', style: TextStyle(fontSize: 16)),
            Text('Email: ${_emailController.text}', style: TextStyle(fontSize: 16)),
            Text('Notas: ${_nota1Controller.text} - ${_nota2Controller.text} - ${_nota3Controller.text}', style: TextStyle(fontSize: 16)),
            Text('Média: ${_media != null ? _media!.toStringAsFixed(1) : ''}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _limpaCampos,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Color(0xFF2395F1),
                ),
                child: Text('Apagar os Campos'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
