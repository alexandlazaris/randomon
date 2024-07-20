import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import '../models/pokemon.dart';

class PokemonService {
  Random random = new Random();
  static const BASE_URL = 'https://pokeapi.co/api/v2/pokemon';

  PokemonService();

  Future<Pokemon> getPokemonById(int id) async {
    int randomNumber = random.nextInt(400) + 1;

    final response = await http.get(Uri.parse(('$BASE_URL/$randomNumber')));
    if (response.statusCode == 200) {
      return Pokemon.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load pokemon data');
    }
  }
}
