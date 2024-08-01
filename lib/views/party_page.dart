import 'package:flutter/material.dart';
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
  List<Color> _colors = [];
  Color _type1 = Colors.white;
  Color _type2 = Colors.white;
  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  late PokemonCard x;
  createCard(Pokemon newPoke) {
    List<String>? listOfTypes = [newPoke.type1!, newPoke.type2!];
    _colors = checkColour(listOfTypes);
    _type1 = _colors[0];
    _type2 = _colors[1];
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

  showDelete() {
    if (caughtPokemonList.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  showEmptyState() {
    if (caughtPokemonList.isNotEmpty) {
      return false;
    } else if (caughtPokemonList.isEmpty) {
      return true;
    }
  }

  @override
  void initState() {
    super.initState();
    print('total list of pokemon: ${caughtPokemonList.length}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: someWidgetKey,
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text('Party: ${caughtPokemonList.length}'),
        backgroundColor: appBarColor,
        actions: [
          Visibility(
            visible: showDelete(),
            child: IconButton(
              onPressed: () {
                showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                          title: const Text('Release all Pokemon?'),
                          content: const Text(
                              'This will clear all caught Pokemon from this list.'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context, 'OK');
                                caughtPokemonList.clear();
                                totalNumberOfPokemonCaught = 0;
                                setState(() {});
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ));
              },
              icon: const Icon(Icons.delete),
              iconSize: 40,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Visibility(
              visible: showEmptyState(),
              child: Padding(
                padding: EdgeInsets.only(top: deviceHeight(context) * 0.3),
                child: const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                          image: AssetImage('assets/icons/pokeball.png'),
                          height: 30,
                          width: 30),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Go back to start catching Pokemon!"),
                      ),
                      Image(
                          image: AssetImage('assets/icons/pokeball.png'),
                          height: 30,
                          width: 30),
                    ],
                  ),
                ),
              )),
          Visibility(
            visible: showDelete(),
            child: SizedBox(
              height: deviceHeight(context) * 0.85,
              child: ListView(
                padding: const EdgeInsets.all(8),
                children: <Widget>[
                  for (var item in caughtPokemonList) createCard(item)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
