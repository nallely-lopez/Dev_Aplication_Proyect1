import 'package:flutter/material.dart';

class FormularioInteractivo extends StatefulWidget {
  const FormularioInteractivo({super.key});

  @override
  State<FormularioInteractivo> createState() => _FormularioInteractivoState();
}

class _FormularioInteractivoState extends State<FormularioInteractivo> {
  final TextEditingController _nombreController = TextEditingController();
  String _mensajeResultado = '';

  @override
  void dispose() {
    _nombreController.dispose();
    super.dispose();
  }

  void _procesarDatos() {
    setState(() {
      String textoIngresado = _nombreController.text.trim();
      if (textoIngresado.isEmpty) {
        _mensajeResultado = 'Por favor, escribe un nombre válido.';
      } else {
        _mensajeResultado =
            '¡Hola, $textoIngresado! Datos recibidos correctamente.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Práctica 5: Formulario Interactivo',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nombreController,
              decoration: const InputDecoration(
                labelText: 'Ingresa tu nombre',
                hintText: 'Ej. Carlos González',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _procesarDatos,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
              ),
              child: const Text(
                'Mostrar Datos',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 30),
            if (_mensajeResultado.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.indigo.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.indigo.shade200),
                ),
                child: Text(
                  _mensajeResultado,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
