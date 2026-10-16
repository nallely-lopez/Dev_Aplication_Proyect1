import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/student.dart';
import 'pantalla_detalle_json.dart';

class PantallaRegistro extends StatefulWidget {
  const PantallaRegistro({super.key});

  @override
  State<PantallaRegistro> createState() => _PantallaRegistroState();
}

class _PantallaRegistroState extends State<PantallaRegistro> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _edadController = TextEditingController();
  final TextEditingController _controlController = TextEditingController();
  final TextEditingController _carreraController = TextEditingController();
  final TextEditingController _semestreController = TextEditingController();

  @override
  void dispose() {
    _nombreController.dispose();
    _edadController.dispose();
    _controlController.dispose();
    _carreraController.dispose();
    _semestreController.dispose();
    super.dispose();
  }

  void _mostrarAviso(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensaje),
        backgroundColor: Colors.redAccent.shade700,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void _registrarEstudiante() {
    String nombre = _nombreController.text.trim();
    String edadTexto = _edadController.text.trim();
    String controlTexto = _controlController.text.trim();
    String carrera = _carreraController.text.trim();
    String semestreTexto = _semestreController.text.trim();

    if (nombre.isEmpty ||
        edadTexto.isEmpty ||
        controlTexto.isEmpty ||
        carrera.isEmpty ||
        semestreTexto.isEmpty) {
      _mostrarAviso('Por favor completa todos los campos del alumno');
      return;
    }

    final int? edad = int.tryParse(edadTexto);
    if (edad == null || edad < 15 || edad > 99) {
      _mostrarAviso('Ingresa una edad válida (entre 15 y 99 años)');
      return;
    }

    final int? numControl = int.tryParse(controlTexto);
    if (numControl == null || controlTexto.length != 8) {
      _mostrarAviso('El número de control debe contener exactamente 8 dígitos');
      return;
    }

    final int? semestre = int.tryParse(semestreTexto);
    if (semestre == null || semestre < 1 || semestre > 14) {
      _mostrarAviso('El semestre debe ser un número válido entre 1 y 14');
      return;
    }

    try {
      final estudiante = Student(
        name: nombre,
        age: edad,
        numcontrol: numControl,
        career: carrera,
        semestre: semestre,
      );

      final String jsonResultante = estudiante.toJsonString();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PantallaDetalleJson(jsonString: jsonResultante),
        ),
      );
    } catch (e) {
      _mostrarAviso(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // CONTAINER 1: Barra superior morada con retorno
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              color: Colors.deepPurple,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Datos de Alumno',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // CONTAINER 2: Formulario flexible con filtros estrictos de entrada
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _nombreController,
                      decoration: const InputDecoration(
                        labelText: 'Nombre completo',
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.deepPurple,
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _edadController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(2),
                      ],
                      decoration: const InputDecoration(
                        labelText: 'Edad (15 - 99 años)',
                        prefixIcon: Icon(Icons.cake, color: Colors.deepPurple),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _controlController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(8),
                      ],
                      decoration: const InputDecoration(
                        labelText: 'No. Control / Matrícula (8 dígitos)',
                        prefixIcon: Icon(Icons.badge, color: Colors.deepPurple),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _carreraController,
                      decoration: const InputDecoration(
                        labelText: 'Carrera',
                        prefixIcon: Icon(
                          Icons.school,
                          color: Colors.deepPurple,
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _semestreController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(2),
                      ],
                      decoration: const InputDecoration(
                        labelText: 'Semestre (1 - 14)',
                        prefixIcon: Icon(
                          Icons.format_list_numbered,
                          color: Colors.deepPurple,
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // CONTAINER 3: Botón inferior de registro
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                border: Border(top: BorderSide(color: Colors.grey.shade300)),
              ),
              child: ElevatedButton.icon(
                onPressed: _registrarEstudiante,
                icon: const Icon(Icons.save, color: Colors.white),
                label: const Text(
                  'Registrar',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
