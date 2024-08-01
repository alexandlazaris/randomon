import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:randomon/models/pokemon.dart';
import 'package:randomon/views/pokemon_card_widget.dart';
import 'package:randomon/globals/variables.dart';
import '../globals/keys.dart'; // Import the common key file

class PartyPage extends StatefulWidget {
  const PartyPage({super.key});

  @override
  State<PartyPage> createState() => PartyPageState();
}

class PartyPageState extends State<PartyPage> {
  final Color _appBarColor = const Color.fromARGB(255, 255, 97, 97);
  final Color _bgColor = const Color.fromARGB(255, 255, 255, 255);
  final List<Color> _colors = [];
  Color _colorForPokemonType = Colors.white;
  Color _type1 = Colors.white;
  Color _type2 = Colors.white;
  int _counter = 0;

  late PokemonCard x;
  createCard(Pokemon newPoke) {
    List<String>? listOfTypes = [newPoke.type1!, newPoke.type2!];
    listOfTypes.asMap().forEach((index, value) {
      print('type $index is $value');
      //TODO: replace the below with enums
      switch (value.toLowerCase()) {
        case "grass":
          _colorForPokemonType = Colors.green;
          break;
        case "bug":
          _colorForPokemonType = Colors.lightGreenAccent;
          break;
        case "poison":
          _colorForPokemonType = Colors.purpleAccent;
          break;
        case "ground":
          _colorForPokemonType = const Color.fromARGB(255, 174, 122, 104);
          break;
        case "rock":
          _colorForPokemonType = Color.fromARGB(255, 132, 106, 96);
          break;
        case "fire":
          _colorForPokemonType = Colors.redAccent;
          break;
        case "water":
          _colorForPokemonType = Colors.blueAccent;
          break;
        case "ice":
          _colorForPokemonType = Colors.lightBlueAccent;
          break;
        case "psychic":
          _colorForPokemonType = Colors.deepPurpleAccent;
          break;
        case "ghost":
          _colorForPokemonType = Color.fromARGB(255, 94, 123, 127);
          break;
        case "dragon":
          _colorForPokemonType = Colors.indigo;
          break;
        case "normal":
          _colorForPokemonType = Colors.white;
          break;
        case "flying":
          _colorForPokemonType = Color.fromARGB(255, 195, 252, 255);
          break;
        case "fighting":
          _colorForPokemonType = Colors.deepOrangeAccent;
          break;
        case "fairy":
          _colorForPokemonType = Colors.pinkAccent;
          break;
        case "steel":
          _colorForPokemonType = Colors.grey;
          break;
        case "dark":
          _colorForPokemonType = Colors.blueGrey;
          break;
        case "electric":
          _colorForPokemonType = Colors.yellowAccent;
          break;
      }
      if (index == 0) _type1 = _colorForPokemonType;
      if (index == 1) _type2 = _colorForPokemonType;
      print('adding colour $_colorForPokemonType for type $value');
      _colors.add(_colorForPokemonType);
    });
    x = PokemonCard(
        pokemonId: newPoke.id,
        pokemonName: newPoke.name,
        type1: newPoke.type1,
        pokemonSpriteUrl: newPoke.spriteUrl,
        colorType1: _type1,
        type2: newPoke.type2,
        colorType2: _type2);
    return x;
  }

  addNewPokemon(Pokemon newPoke) {
    _counter++;
    setState(() {});
  }

  getCounter() {
    print('from within getCounter(): $_counter');
    return _counter;
  }

  void counterAdd() {
    setState(() {
      print('from within setState(): $_counter');
      _counter = 10;
    });
    print('from within counterAdd(): $_counter');
  }

  @override
  void initState() {
    super.initState();
    print('total list of pokemon: ${listOfPokemon.length}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: someWidgetKey,
        backgroundColor: _bgColor,
        appBar: AppBar(
          title: const Text("Caught pokemon"),
          backgroundColor: _appBarColor,
          //TODO: add a delete all caught pokemon function here
          //TODO: add a empty state widget
        ),
        body:
            //     ListView(
            //   padding: const EdgeInsets.all(8),
            //   children: <Widget>[for (var item in listOfPokemon) createCard(item)],
            // ),
            ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: listOfPokemon.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage('assets/icons/pokeball-open.png')))),
                Container(child: createCard(listOfPokemon[index])),
              ],
            );
          },
        ));
  }
}
