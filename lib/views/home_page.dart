import 'package:flutter/material.dart';
import 'package:randomon/models/pokemon.dart';
import 'package:randomon/services/pokemon_service.dart';
import 'pokemon_card_widget.dart';
// not the best bounce effect, but it will do for now
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pokemonService = PokemonService();
  int numberOfPokemonLoaded = 0;
  Pokemon? _pokemon;
  bool _loading = true;
  Color colorForPokemonType = Colors.white;
  Color type1 = Colors.white;
  Color type2 = Colors.white;
  List<Color> colors = [];
  Color appBarColor = Color.fromARGB(255, 161, 166, 167);
  Color bgColor = const Color.fromARGB(255, 115, 115, 115);

  _getPokemon() async {
    try {
      _loading = false;
      // TODO: how to get a callback(?) or trigger when this function has been completed
      var pokemon = await _pokemonService.getPokemonById(2);
      numberOfPokemonLoaded++;
      setState(() {
        _pokemon = pokemon;
        List<String>? listOfTypes = [pokemon.type1!, pokemon.type2!];
        listOfTypes.asMap().forEach((index, value) {
          print('type $index is $value');
          //TODO: replace the below with enums
          switch (value.toLowerCase()) {
            case "grass":
              colorForPokemonType = Colors.green;
              break;
            case "bug":
              colorForPokemonType = Colors.lightGreenAccent;
              break;
            case "poison":
              colorForPokemonType = Colors.purpleAccent;
              break;
            case "ground":
              colorForPokemonType = const Color.fromARGB(255, 174, 122, 104);
              break;
            case "rock":
              colorForPokemonType = Color.fromARGB(255, 132, 106, 96);
              break;
            case "fire":
              colorForPokemonType = Colors.redAccent;
              break;
            case "water":
              colorForPokemonType = Colors.blueAccent;
              break;
            case "ice":
              colorForPokemonType = Colors.lightBlueAccent;
              break;
            case "psychic":
              colorForPokemonType = Colors.deepPurpleAccent;
              break;
            case "ghost":
              colorForPokemonType = Color.fromARGB(255, 94, 123, 127);
              break;
            case "dragon":
              colorForPokemonType = Colors.indigo;
              break;
            case "normal":
              colorForPokemonType = Colors.white;
              break;
            case "flying":
              colorForPokemonType = Color.fromARGB(255, 195, 252, 255);
              break;
            case "fighting":
              colorForPokemonType = Colors.deepOrangeAccent;
              break;
            case "fairy":
              colorForPokemonType = Colors.pinkAccent;
              break;
            case "steel":
              colorForPokemonType = Colors.grey;
              break;
            case "dark":
              colorForPokemonType = Colors.blueGrey;
              break;
            case "electric":
              colorForPokemonType = Colors.yellowAccent;
              break;
          }
          if (index == 0) type1 = colorForPokemonType;
          if (index == 1) type2 = colorForPokemonType;
          print('adding colour $colorForPokemonType for type $value');
          colors.add(colorForPokemonType);
        });
        _loading = true;
      });
    } catch (e) {
      print('Error when fetching pokemon data: ${e}');
    }
  }

  @override
  void initState() {
    super.initState();
    _getPokemon();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          title: const Text(
            "Find your Pokemon",
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return SecondPage(
                    pokemonName: _pokemon?.name,
                    loadedCount: numberOfPokemonLoaded);
              },
            )),
            icon: Icon(Icons.settings_sharp, size: 30),
          ),
          backgroundColor: appBarColor,
        ),
        bottomNavigationBar: Container(
          color: appBarColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                color: Colors.white,
                onPressed: () => Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return SecondPage(
                        pokemonName: _pokemon?.name,
                        loadedCount: numberOfPokemonLoaded);
                  },
                )),
                icon: const Icon(Icons.settings_sharp, size: 30),
              ),
            ],
          ),
        ),
        body: Column(children: [
          //TODO: stop loading skeleton UI once loaded
          PokemonCard(
              pokemonName: _pokemon?.name.toString(),
              pokemonId: _pokemon?.id,
              pokemonSpriteUrl: _pokemon?.spriteUrl,
              type1: _pokemon?.type1,
              colorType1: type1,
              type2: _pokemon?.type2,
              colorType2: type2),
          Container(
            padding: const EdgeInsets.only(top: 100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  splashRadius: 100,
                  onPressed: () {
                    // TODO: show a loading indicator here when fetching pokemon data
                    print("load new pokemon");
                    _getPokemon();
                  },
                  icon: Image.asset(
                    'assets/icons/circular-arrow.png',
                    color: appBarColor,
                    height: 50,
                    width: 50,
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Bounceable(
                    duration: const Duration(milliseconds: 500),
                    reverseDuration: const Duration(milliseconds: 500),
                    scaleFactor: 0.1,
                    curve: Curves.bounceIn,
                    reverseCurve: Curves.bounceOut,
                    onTap: () {
                      print("bounce");
                    },
                    child: IconButton(
                        icon: Image.asset(
                          'assets/icons/pokeball.png',
                          height: 75,
                          width: 75,
                        ),
                        splashRadius: 100,
                        onPressed: () {
                          //TODO: add FX when pokemon is caught
                          //TODO: add current pokemon to a caught (liked) list
                        }),
                  ),
                ),
              ],
            ),
          ),
        ]));
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage(
      {super.key, required this.pokemonName, required this.loadedCount});

  final String? pokemonName;
  final int loadedCount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Debug page",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView(
        children: [
          Text('latest pokemon: $pokemonName'),
          Text('number of pokemon loaded: $loadedCount')
        ],
      ),
    );
  }
}
