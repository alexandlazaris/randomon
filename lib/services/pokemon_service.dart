import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import '../models/pokemon.dart';

class PokemonService {
  Random random = new Random();
  static const baseUrl = 'https://pokeapi.co/api/v2/pokemon';

  PokemonService();

  Future<Pokemon> getPokemonById(int number) async {
    /* up to and including GENIV
    source: https://bulbapedia.bulbagarden.net/wiki/Generation
    */
    var randomNumber = Random().nextInt(493) + 1;
    final response = await http.get(Uri.parse(('$baseUrl/$randomNumber')));
    // final response = await http.get(Uri.parse(('$baseUrl/487')));
    if (response.statusCode == 200) {
      return Pokemon.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load pokemon data');
    }
  }
}
