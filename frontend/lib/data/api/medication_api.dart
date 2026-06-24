import 'dart:convert';
import 'package:http/http.dart' as http;

class MedicationApi {
  static const String baseUrl =
      "http://10.0.2.2:8081/api/medications";

  static Future<List<dynamic>> getAll() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Error loading data");
    }
  }

  static Future<void> delete(int id) async {
    await http.delete(Uri.parse("$baseUrl/$id"));
  }
}