import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PokemonCard extends StatelessWidget {
  final String? pokemonId;
  final String? pokemonName;
  final String? type1;
  final String? type2;
  final String? pokemonSpriteUrl;
  final Color colorType1;
  final Color? colorType2;

  const PokemonCard(
      {super.key,
      required this.pokemonId,
      required this.pokemonName,
      required this.type1,
      this.type2,
      required this.pokemonSpriteUrl,
      required this.colorType1,
      this.colorType2});

  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              //TODO: alignment is wrong here, they are too much on the right
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: colorType1,
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  border: Border.all(color: Colors.black, width: 1.0)),
              child: FittedBox(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '$pokemonName #$pokemonId',
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
              ),
            )
          ]),
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: SizedBox(
                  height: 150,
                  width: 150,
                  child: CachedNetworkImage(
                      imageUrl: '$pokemonSpriteUrl',
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.question_mark),
                      fit: BoxFit.contain)),
            )
          ]),
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 50,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: colorType1,
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  border: Border.all(color: Colors.black, width: 1.0)),
              child: FittedBox(
                child: Text(
                  '$type1',
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            if (type2 != "")
              Container(
                width: 150,
                height: 50,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: colorType2,
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    border: Border.all(color: Colors.black, width: 1.0)),
                child: FittedBox(
                  child: Text(
                    '$type2',
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
              )
            else
              const Visibility(visible: false, child: Scaffold())
          ]),
    ]);
  }
}
