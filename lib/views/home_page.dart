import 'package:flutter/material.dart';
import 'package:randomon/models/pokemon.dart';
import 'package:randomon/services/pokemon_service.dart';
import 'package:randomon/views/debug_page.dart';
import 'package:randomon/globals/variables.dart';
import 'pokemon_card_widget.dart';
import 'party_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pokemonService = PokemonService();
  Pokemon? _pokemon;
  bool showCard = false;
  bool showReload = false;
  bool showLoading = false;
  bool showPokeballPlaceholder = false;
  Color colorForPokemonType = Colors.white;
  Color type1 = Colors.white;
  Color type2 = Colors.white;
  List<Color> colors = [];
  Color appBarColor = Color.fromARGB(255, 255, 97, 97);
  Color bgColor = Color.fromARGB(255, 255, 255, 255);
  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
  String _catchToastMsg = "";

  _getPokemon() async {
    try {
      showLoading = true;
      showReload = false;
      showPokeballPlaceholder = true;
      var pokemon = await _pokemonService.getPokemonById();
      totalNumberOfPokemonLoaded++;
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
        showLoading = false;
        showCard = true;
        showReload = true;
        showPokeballPlaceholder = false;
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

/*
  [ 
    { "id: 1", "name: "Whiscash"},
    { "id: 2", "name: "Shelgon"},
    { "id: 3", "name: "Shelgon"}.
  ]
*/
  checkIfPokemonAlreadyCaught(Pokemon pokemon) {
    if (listOfPokemon.isNotEmpty) {
      print('list is not empty');
      if (listOfPokemon.contains(pokemon)) {
        print('list already contains ${pokemon.name}');
        cannotCatch(pokemon);
      }
      if (!listOfPokemon.contains(pokemon)) {
        print('list does not contain ${pokemon.name}');
        addNewPokemon(pokemon);
      }
    }
    if (listOfPokemon.isEmpty) {
      print('list is empty');
      addNewPokemon(pokemon);
    }
  }

  cannotCatch(Pokemon pokemon) {
    print('already caught ${pokemon.name}');
    _catchToastMsg = 'You already caught ${pokemon.name}.';
  }

  addNewPokemon(Pokemon pokemon) {
    listOfPokemon.add(_pokemon!);
    totalNumberOfPokemonCaught++;
    print('newly caught $pokemon');
    _catchToastMsg = 'Nice! ${pokemon.name} has been added to your party.';
  }

  setToastMessageText(String text) {
    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          title: const Text(
            "Choose your Pokemon!",
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            onPressed: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const DebugPage();
            })),
            icon: const Icon(Icons.settings_sharp, size: 30),
          ),
          backgroundColor: appBarColor,
        ),
        bottomNavigationBar: Container(
          color: appBarColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PartyPage();
                  }));
                },
                icon: Image.asset(
                  'assets/icons/hat.png',
                  height: 50,
                  width: 50,
                ),
              ),
            ],
          ),
        ),
        body: Column(children: [
          Visibility(
              visible: showLoading,
              child: Container(
                  margin: const EdgeInsets.only(top: 100),
                  height: 100,
                  width: 100,
                  child: const Image(
                      image: AssetImage('assets/icons/pokeball.png')))),
          Visibility(
            visible: showCard,
            child: Container(
              margin: EdgeInsets.only(
                  top: deviceHeight(context) * 0.1, left: 10, right: 10),
              padding: const EdgeInsets.all(10),
              child: PokemonCard(
                  pokemonName: _pokemon?.name,
                  pokemonId: _pokemon?.id,
                  pokemonSpriteUrl: _pokemon?.spriteUrl,
                  type1: _pokemon?.type1,
                  colorType1: type1,
                  type2: _pokemon?.type2,
                  colorType2: type2),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Visibility(
                  visible: showReload,
                  child: IconButton(
                    splashRadius: 100,
                    onPressed: () {
                      print("load new pokemon pressed");
                      _getPokemon();
                      showCard = false;
                      setState(() {});
                    },
                    icon: Image.asset(
                      'assets/icons/circular-arrow.png',
                      color: appBarColor,
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),
                Visibility(
                  visible: showReload,
                  child: IconButton(
                    splashRadius: 100,
                    onPressed: () {
                      checkIfPokemonAlreadyCaught(_pokemon!);
                      // addNewPokemon(_pokemon!);
                      setToastMessageText(_catchToastMsg);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        showCloseIcon: true,
                        duration: const Duration(seconds: 2),
                        backgroundColor: const Color.fromARGB(255, 93, 25, 20),
                        content: Text(_catchToastMsg),
                      ));
                      // someWidgetKey.currentState?.addNewPokemon(_pokemon!);
                      // someWidgetKey.currentState?.counterAdd();
                      // print(
                      //     'from home page, counter is: ${someWidgetKey.currentState?.getCounter()}');
                    },
                    icon: Image.asset(
                      'assets/icons/pokeball.png',
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),
                Visibility(
                  visible: showPokeballPlaceholder,
                  child: const SizedBox(
                      height: 100,
                      width: 100,
                      child: Text(
                        "loading ... ",
                        textAlign: TextAlign.center,
                      )),
                ),
              ],
            ),
          ),
        ]));
  }
}
