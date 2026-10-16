import 'package:flutter/material.dart';

import '../models/student.dart';

class PantallaDetalleJson extends StatelessWidget {
  final String jsonString;

  const PantallaDetalleJson({super.key, required this.jsonString});

  @override
  Widget build(BuildContext context) {
    // Deserialización y verificación de integridad
    final Student alumno = Student.fromJsonString(jsonString);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // CONTAINER 1: Barra superior morada
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 18),
              color: Colors.deepPurple,
              child: const Center(
                child: Text(
                  'Datos del Estudiante',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // CONTAINER 2: Sección central con tarjetas organizadas
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: const Icon(
                        Icons.person,
                        color: Colors.deepPurple,
                      ),
                      title: const Text(
                        'Nombre',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      subtitle: Text(
                        alumno.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.cake, color: Colors.deepPurple),
                      title: const Text(
                        'Edad',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      subtitle: Text(
                        '${alumno.age} años',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: const Icon(
                        Icons.badge,
                        color: Colors.deepPurple,
                      ),
                      title: const Text(
                        'No. de Control / Matrícula',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      subtitle: Text(
                        alumno.numcontrol.toString(),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: const Icon(
                        Icons.school,
                        color: Colors.deepPurple,
                      ),
                      title: const Text(
                        'Carrera',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      subtitle: Text(
                        alumno.career,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: const Icon(
                        Icons.format_list_numbered,
                        color: Colors.deepPurple,
                      ),
                      title: const Text(
                        'Semestre',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      subtitle: Text(
                        '${alumno.semestre}° Semestre',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // CONTAINER 3: Botón inferior para regresar a la raíz
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                border: Border(top: BorderSide(color: Colors.grey.shade300)),
              ),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                icon: const Icon(Icons.home, color: Colors.white),
                label: const Text(
                  'Volver al inicio',
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
