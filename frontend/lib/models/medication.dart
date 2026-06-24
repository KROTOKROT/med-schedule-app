class Medication {
  final int? id;
  final String name;
  final String dosage;
  final String time;
  final String instructions;

  Medication({
    this.id,
    required this.name,
    required this.dosage,
    required this.time,
    required this.instructions,
  });

  factory Medication.fromJson(Map<String, dynamic> json) {
    return Medication(
      id: json['id'],
      name: json['name'] ?? '',
      dosage: json['dosage'] ?? '',
      time: json['time'] ?? '',
      instructions: json['instructions'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'dosage': dosage,
      'time': time,
      'instructions': instructions,
    };
  }
}