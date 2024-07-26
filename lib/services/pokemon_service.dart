import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import '../models/pokemon.dart';

class PokemonService {
  Random random = new Random();
  static const baseUrl = 'https://pokeapi.co/api/v2/pokemon';

  PokemonService();

  Future<Pokemon> getPokemonById(int number) async {
    // these random numbers are causing errors
    // instead load a random number when the button is pressed?
    // int randomNumber = random.nextInt(300) + 1;
    var randomNumber = Random().nextInt(300) + 1;
    final response = await http.get(Uri.parse(('$baseUrl/$randomNumber')));
    // final response = await http.get(Uri.parse(('$baseUrl/3')));
    // final response = await http.get(Uri.parse(('$baseUrl/$number')));
    // await Future.delayed(const Duration(seconds: 1));
    if (response.statusCode == 200) {
      return Pokemon.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load pokemon data');
    }
  }
}
