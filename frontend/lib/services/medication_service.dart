import 'dart:convert';
import 'package:http/http.dart' as http;
import '/models/medication.dart';

class MedicationService {
  static const String baseUrl = "http://10.0.2.2:8081/api";

  static Future<List<Medication>> getAll() async {
    final res = await http.get(Uri.parse("$baseUrl/medications"));

    final List data = jsonDecode(res.body);
    return data.map((e) => Medication.fromJson(e)).toList();
  }

  static Future<Medication> getById(int id) async {
    final res = await http.get(Uri.parse("$baseUrl/medications/$id"));
    return Medication.fromJson(jsonDecode(res.body));
  }

  static Future<void> add(Medication m) async {
    await http.post(
      Uri.parse("$baseUrl/medications"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(m.toJson()),
    );
  }

  static Future<void> update(int id, Medication m) async {
    await http.put(
      Uri.parse("$baseUrl/medications/$id"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(m.toJson()),
    );
  }

  static Future<void> delete(int id) async {
    await http.delete(Uri.parse("$baseUrl/medications/$id"));
  }
}