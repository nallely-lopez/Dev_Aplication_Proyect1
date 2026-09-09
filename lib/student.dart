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

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      name: json['name'] as String? ?? '',
      age: json['age'] as int? ?? 0,
      numcontrol: json['numcontrol'] as int? ?? 0,
      career: json['career'] as String? ?? '',
      semestre: json['semestre'] as int? ?? 0,
    );
  }
}
