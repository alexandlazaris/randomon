import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import '../models/pokemon.dart';

class PokemonService {
  Random random = new Random();
  static const baseUrl = 'https://pokeapi.co/api/v2/pokemon';

  PokemonService();

  Future<Pokemon> getPokemonById() async {
    int randomNumber = random.nextInt(151) + 1;

    final response = await http.get(Uri.parse(('$baseUrl/$randomNumber')));
    if (response.statusCode == 200) {
      return Pokemon.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load pokemon data');
    }
  }
}
