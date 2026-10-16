import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/pelicula.dart';

class JsonService {
  Future<List<Pelicula>> cargarPeliculas() async {
    final String respuesta = await rootBundle.loadString(
      'assets/data/peliculas.json',
    );

    final List<dynamic> datos = json.decode(respuesta);

    return datos.map((pelicula) => Pelicula.fromJson(pelicula)).toList();
  }
}
