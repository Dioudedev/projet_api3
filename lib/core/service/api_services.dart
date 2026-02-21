import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class ApiService {
  static const String _baseUrl = 'https://retoolapi.dev/WJ3Goj/data';
  static Future<List<Map<String, dynamic>>> fetchAllUsers() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        final dynamic data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data);
      } else {
        final code = response.statusCode;
        final raison = response.reasonPhrase;
        throw Exception('Erreur de chargement :$code,$raison');
      }
    } catch (e) {
      print('une erreur s\'est produit:$e, $StackTrace');
      rethrow;
    }
  }
}
