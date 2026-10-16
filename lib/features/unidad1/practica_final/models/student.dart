import 'dart:convert';

class Student {
  final String name;
  final int age;
  final int numcontrol;
  final String career;
  final int semestre;

  Student({
    required this.name,
    required this.age,
    required this.numcontrol,
    required this.career,
    required this.semestre,
  });

  static int _validarEntero(dynamic valor, String nombreCampo) {
    if (valor is int) return valor;
    if (valor is String) {
      final int? parseado = int.tryParse(valor.trim());
      if (parseado == null) {
        throw FormatException(
          'El campo "$nombreCampo" no acepta letras, solo números enteros válidos.',
        );
      }
      return parseado;
    }
    throw FormatException('El formato de "$nombreCampo" no es válido.');
  }

  factory Student.fromJson(Map<String, dynamic> json) {
    final int edad = _validarEntero(json['age'], 'Edad');
    if (edad < 15 || edad > 99) {
      throw const FormatException(
        'La edad debe estar en el rango de 15 a 99 años.',
      );
    }

    final int numCtrl = _validarEntero(json['numcontrol'], 'No. de Control');
    if (numCtrl.toString().length != 8) {
      throw const FormatException(
        'El número de control debe tener exactamente 8 dígitos.',
      );
    }

    final int sem = _validarEntero(json['semestre'], 'Semestre');
    if (sem < 1 || sem > 14) {
      throw const FormatException(
        'El semestre debe ser un número entre 1 y 14.',
      );
    }

    return Student(
      name: json['name'] as String? ?? '',
      age: edad,
      numcontrol: numCtrl,
      career: json['career'] as String? ?? '',
      semestre: sem,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'numcontrol': numcontrol,
      'career': career,
      'semestre': semestre,
    };
  }

  String toJsonString() => jsonEncode(toJson());

  factory Student.fromJsonString(String source) =>
      Student.fromJson(jsonDecode(source) as Map<String, dynamic>);
}
