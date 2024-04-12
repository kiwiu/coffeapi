import 'dart:convert';
import 'package:http/http.dart' as http;

class CafeApi {
  
  static Future<List<Map<String, dynamic>>> getCoffe() async {
    final response = await http.get(Uri.parse('http://localhost/coffeapi/getAll'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return List<Map<String, dynamic>>.from(data);
    } else {
      return [];
    }
  }

  static Future<void> createCoffe(Map<String, dynamic> data) async {
    final url = Uri.parse('http://localhost/coffeapi/create');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode != 200) {
      throw Exception('Error al crear el café');
    }
  }
  

  static Future<void> updateCoffe(Map<String, dynamic> data) async {
    final url = Uri.parse('http://localhost/coffeapi/update');
    final response = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode != 200) {
      throw Exception('Error al actualizar el café');
    }
  }

  static Future<void> deleteCoffe(int id) async {
    final url = Uri.parse('http://localhost/coffeapi/delete/$id');
    final response = await http.delete(url);
    if (response.statusCode != 200) {
      throw Exception('Error al eliminar el café');
    }
  }

}
