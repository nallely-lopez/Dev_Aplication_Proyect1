import 'package:flutter/material.dart';

import '../models/pelicula.dart';
import '../screens/detalle_pelicula_screen.dart';

class PeliculaCard extends StatelessWidget {
  final Pelicula pelicula;

  const PeliculaCard({super.key, required this.pelicula});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetallePeliculaScreen(pelicula: pelicula),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              pelicula.imagen,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pelicula.titulo,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('${pelicula.genero} - ${pelicula.anio}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
