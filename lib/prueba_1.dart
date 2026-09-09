import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'student.dart';

class Prueba extends StatelessWidget {
  const Prueba({super.key});

  Future<Student> _loadStudentData() async {
    final String response = await rootBundle.loadString('lib/data.json');
    final Map<String, dynamic> data = json.decode(response);
    return Student.fromJson(data);
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryPurple = Color.fromARGB(255, 66, 0, 146);
    const Color titleBlue = Color.fromARGB(255, 30, 64, 175);
    const Color iconBlue = Color.fromARGB(255, 2, 132, 199);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Anatomía de Flutter',
          style: TextStyle(color: primaryPurple, fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder<Student>(
        future: _loadStudentData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error al cargar los datos: ${snapshot.error}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          if (!snapshot.hasData) {
            return const Center(child: Text('No hay datos disponibles'));
          }

          final student = snapshot.data!;

          return ListView(
            children: [
              ListTile(
                leading: const Icon(Icons.start, color: iconBlue),
                title: const Text(
                  'Nombre',
                  style: TextStyle(
                    color: titleBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(student.name),
                trailing: const Icon(Icons.arrow_forward),
              ),
              ListTile(
                leading: const Icon(Icons.start, color: iconBlue),
                title: const Text(
                  'Edad',
                  style: TextStyle(
                    color: titleBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text('${student.age} años'),
                trailing: const Icon(Icons.arrow_forward),
              ),
              ListTile(
                leading: const Icon(Icons.start, color: iconBlue),
                title: const Text(
                  'Número de Control',
                  style: TextStyle(
                    color: titleBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text('${student.numcontrol}'),
                trailing: const Icon(Icons.arrow_forward),
              ),
              ListTile(
                leading: const Icon(Icons.start, color: iconBlue),
                title: const Text(
                  'Carrera',
                  style: TextStyle(
                    color: titleBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(student.career),
                trailing: const Icon(Icons.arrow_forward),
              ),
              ListTile(
                leading: const Icon(Icons.start, color: iconBlue),
                title: const Text(
                  'Semestre',
                  style: TextStyle(
                    color: titleBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text('Semestre ${student.semestre}'),
                trailing: const Icon(Icons.arrow_forward),
              ),
            ],
          );
        },
      ),
    );
  }
}
