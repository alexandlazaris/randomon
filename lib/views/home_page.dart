import 'dart:io';

import 'package:flutter/material.dart';
import 'package:randomon/models/pokemon.dart';
import 'package:randomon/services/pokemon_service.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pokemonService = PokemonService();
  Pokemon? _pokemon;
  Color color = Colors.white;

  // PaletteGenerator? paletteGenerator;
  final List<String> images = ['assets/3.png'];

  _getPokemon() async {
    try {
      var pokemon = await _pokemonService.getPokemonById();
      setState(() {
        _pokemon = pokemon;
        switch (pokemon.types?[0]) {
          case "grass":
            color = Colors.greenAccent;
            break;
          case "bug":
            color = Colors.lightGreenAccent;
            break;
          case "poison":
            color = Colors.purpleAccent;
            break;
          case "ground":
            color = const Color.fromARGB(255, 174, 122, 104);
            break;
          case "rock":
            color = const Color.fromARGB(255, 82, 48, 35);
            break;
          case "fire":
            color = Colors.redAccent;
            break;
          case "water":
            color = Colors.blueAccent;
            break;
          case "ice":
            color = Colors.lightBlueAccent;
            break;
          case "psychic":
            color = Colors.deepPurpleAccent;
            break;
          case "ghost":
            color = Colors.grey;
            break;
          case "dragon":
            color = Colors.indigo;
            break;
          case "normal":
            color = Colors.white;
            break;
          case "flying":
            color = Color.fromARGB(255, 195, 252, 255);
            break;
          case "fighting":
            color = Colors.deepOrangeAccent;
            break;
          case "fairy":
            color = Colors.pinkAccent;
            break;
          case "steel":
            color = Colors.blueGrey;
            break;
          case "dark":
            color = Colors.black;
            break;
          case "electric":
            color = Colors.yellowAccent;
            break;
        }
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
      backgroundColor: color,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //TODO: handle loading data, takes ~1.5seconds
            Text(
              (_pokemon?.name).toString().toUpperCase(),
              style: const TextStyle(fontSize: 50),
            ),
            Text((_pokemon?.id).toString()),
            Text(
              (_pokemon?.types?.join(", ")).toString(),
              style: const TextStyle(fontSize: 20),
            ),
            //TODO: add a background colour matcher based off primary gif colour
            SizedBox(
              height: 150,
              width: 150,
              child: CachedNetworkImage(
                  cacheKey: _pokemon?.name,
                  imageUrl: (_pokemon?.spriteUrl).toString(),
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.question_mark),
                  fit: BoxFit.fill),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            IconButton(
              icon: const Icon(Icons.autorenew),
              iconSize: 30,
              onPressed: () {
                _getPokemon();
              },
            )
          ],
          //TODO: add pokeball button to load another
        ),
      ),
    );
  }
}
