class Pelicula {
  final int id;
  final String titulo;
  final String imagen;
  final String genero;
  final int anio;
  final String descripcion;
  final List<String> actores;

  Pelicula({
    required this.id,
    required this.titulo,
    required this.imagen,
    required this.genero,
    required this.anio,
    required this.descripcion,
    required this.actores,
  });

  factory Pelicula.fromJson(Map<String, dynamic> json) {
    return Pelicula(
      id: json['id'],
      titulo: json['titulo'],
      imagen: json['imagen'],
      genero: json['genero'],
      anio: json['anio'],
      descripcion: json['descripcion'],
      actores: List<String>.from(json['actores']),
    );
  }
}
