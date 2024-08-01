// global variables

import 'package:randomon/models/pokemon.dart';
import 'package:flutter/material.dart';

List<Pokemon> caughtPokemonList = [];
int totalNumberOfPokemonLoaded = 0;
int totalNumberOfPokemonCaught = 0;

const Color appBarColor = const Color.fromARGB(255, 255, 97, 97);
const Color bgColor = const Color.fromARGB(255, 255, 255, 255);

Color grass = Colors.green;
Color bug = Colors.lightGreenAccent;
Color poison = Colors.purpleAccent;
Color ground = Color.fromARGB(255, 174, 122, 104);
Color rock = Color.fromARGB(255, 132, 106, 96);
Color fire = Colors.redAccent;
Color water = Colors.blueAccent;
Color ice = Colors.lightBlueAccent;
Color psychic = Colors.deepPurpleAccent;
Color ghost = Color.fromARGB(255, 94, 123, 127);
Color dragon = Colors.indigo;
Color normal = Colors.white;
Color flying = Color.fromARGB(255, 195, 252, 255);
Color fighting = Colors.deepOrangeAccent;
Color fairy = Colors.pinkAccent;
Color steel = Colors.grey;
Color dark = Colors.blueGrey;
Color electric = Colors.yellowAccent;

checkColour(List<String>? typeList) {
  // default colour choice
  print('checking colours');
  List<Color> _colors = [];
  Color _colorForPokemonType = Colors.white;
  typeList?.asMap().forEach((index, value) {
    print('type $index is $value');
    switch (value.toLowerCase()) {
      case "grass":
        _colorForPokemonType = grass;
        break;
      case "bug":
        _colorForPokemonType = bug;
        break;
      case "poison":
        _colorForPokemonType = poison;
        break;
      case "ground":
        _colorForPokemonType = ground;
        break;
      case "rock":
        _colorForPokemonType = rock;
        break;
      case "fire":
        _colorForPokemonType = fire;
        break;
      case "water":
        _colorForPokemonType = water;
        break;
      case "ice":
        _colorForPokemonType = ice;
        break;
      case "psychic":
        _colorForPokemonType = psychic;
        break;
      case "ghost":
        _colorForPokemonType = ghost;
        break;
      case "dragon":
        _colorForPokemonType = dragon;
        break;
      case "normal":
        _colorForPokemonType = normal;
        break;
      case "flying":
        _colorForPokemonType = flying;
        break;
      case "fighting":
        _colorForPokemonType = fighting;
        break;
      case "fairy":
        _colorForPokemonType = fairy;
        break;
      case "steel":
        _colorForPokemonType = steel;
        break;
      case "dark":
        _colorForPokemonType = dark;
        break;
      case "electric":
        _colorForPokemonType = electric;
        break;
    }
    print('adding colour $_colorForPokemonType for type $value');
    _colors.add(_colorForPokemonType);
  });
  return _colors;
}
