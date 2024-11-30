import 'dart:convert';
import 'package:apibloc/models/character_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://rickandmortyapi.com/api/character";
  final String baseUrl1 = "https://rickandmortyapi.com/api/character";

  Future<List<Character>> fetchCharacters() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> results = data['results'];
        
        // Convert dynamic list to List<Character>
        return results.map((characterData) => Character.fromJson(characterData)).toList();
      } else {
        throw Exception("Failed to load characters");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}