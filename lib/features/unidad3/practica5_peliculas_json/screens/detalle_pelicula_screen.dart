import 'package:flutter/material.dart';

import '../models/pelicula.dart';

class DetallePeliculaScreen extends StatelessWidget {
  final Pelicula pelicula;

  const DetallePeliculaScreen({super.key, required this.pelicula});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pelicula.titulo)),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Image.network(
              pelicula.imagen,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),

            Padding(
              padding: const EdgeInsets.all(16),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    pelicula.titulo,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    '${pelicula.genero} - ${pelicula.anio}',
                    style: const TextStyle(fontSize: 18),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    pelicula.descripcion,
                    style: const TextStyle(fontSize: 16),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'Actores principales:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  ...pelicula.actores.map(
                    (actor) =>
                        Text('• $actor', style: const TextStyle(fontSize: 16)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
