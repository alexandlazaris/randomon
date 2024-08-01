import 'package:randomon/globals/variables.dart';
import 'package:flutter/material.dart';

class DebugPage extends StatelessWidget {
  const DebugPage({super.key});

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
          Text('number of pokemon loaded: $totalNumberOfPokemonLoaded'),
          Text('number of pokemon caught: $totalNumberOfPokemonCaught')
        ],
      ),
    );
  }
}
