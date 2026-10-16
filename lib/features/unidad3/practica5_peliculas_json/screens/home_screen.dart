import 'package:flutter/material.dart';

import '../utils/json_service.dart';
import '../models/pelicula.dart';
import '../widgets/pelicula_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Catálogo de Películas')),

      body: FutureBuilder<List<Pelicula>>(
        future: JsonService().cargarPeliculas(),

        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error al cargar películas'));
          }

          final peliculas = snapshot.data ?? [];

          return ListView.builder(
            itemCount: peliculas.length,

            itemBuilder: (context, index) {
              return PeliculaCard(pelicula: peliculas[index]);
            },
          );
        },
      ),
    );
  }
}
