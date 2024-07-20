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

  _getPokemon() async {
    try {
      final pokemon = await _pokemonService.getPokemonById(1);
      setState(() {
        _pokemon = pokemon;
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
        title: const Text("Randomon"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              _pokemon?.name ?? ".",
            ),
            Text(_pokemon?.id ?? ".."),
            Text(
              _pokemon?.types?.join(", ") ?? "...",
            ),
            CachedNetworkImage(
              imageUrl: (_pokemon?.spriteUrl).toString(),
              placeholder: (context, url) => new CircularProgressIndicator(),
              errorWidget: (context, url, error) => new Icon(Icons.error),
            )
          ],
          //TODO: add pokeball button to load another
        ),
      ),
    );
  }
}
