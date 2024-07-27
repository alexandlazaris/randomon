import 'package:flutter/material.dart';
import 'package:randomon/models/pokemon.dart';
import 'package:randomon/services/pokemon_service.dart';
import 'pokemon_card_widget.dart';

class HomePage extends StatefulWidget {
  // const HomePage({Key? key}) : super(key: key);
  const HomePage({super.key});

  @override
  // _HomePageState createState() => _HomePageState();
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pokemonService = PokemonService();
  int numberOfPokemonLoaded = 0;
  Pokemon? _pokemon;
  Color colorForPokemonType = Colors.white;
  Color type1 = Colors.white;
  Color type2 = Colors.white;
  List<Color> colors = [];

  _getPokemon() async {
    try {
      var pokemon = await _pokemonService.getPokemonById(2);
      numberOfPokemonLoaded++;
      setState(() {
        _pokemon = pokemon;
        List<String>? listOfTypes = [pokemon.type1!, pokemon.type2!];
        listOfTypes.asMap().forEach((index, value) {
          print('type $index is $value');
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
      appBar: AppBar(
        title: const Text(
          "Randomon",
          style: TextStyle(color: Colors.black, fontSize: 30),
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
        backgroundColor: type1,
      ),

      backgroundColor: colorForPokemonType,
      //find out how to add more children here
      body: PokemonCard(
          pokemonName: _pokemon?.name.toString(),
          pokemonId: _pokemon?.id,
          pokemonSpriteUrl: _pokemon?.spriteUrl,
          type1: _pokemon?.type1,
          colorType1: type1,
          type2: _pokemon?.type2,
          // the color array are causing issues
          colorType2: type2),
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              child: IconButton(
                // TODO: this colour might not be needed
                color: Colors.white,
                //TODO: this icon is behind the footer button when running on device
                icon: Image.asset(
                  'icons/pokeball.png',
                  fit: BoxFit.fill,
                ),
                iconSize: 50,
                onPressed: () {
                  // TODO: show a loading indicator here when fetching pokemon data
                  print("load new pokemon");
                  _getPokemon();
                },
              ),
            ),
          ],
        )
      ],
    );
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
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
          child: ListView(
        children: [
          Text('latest pokemon: $pokemonName'),
          Text('number of pokemon loaded: $loadedCount')
        ],
      )),
    );
  }
}
