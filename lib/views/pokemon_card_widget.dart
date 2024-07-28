import 'package:flutter/material.dart';
/* below was causing below errors:
The following ImageCodecException was thrown resolving an image codec:
Failed to detect image file format using the file header.
File header was [0x3c 0x21 0x44 0x4f 0x43 0x54 0x59 0x50 0x45 0x20].
Image source: encoded image bytes
Image provider: NetworkImage("null", scale: 1.0)
Image key: NetworkImage("null", scale: 1.0)
*/
import 'package:cached_network_image/cached_network_image.dart';

class PokemonCard extends StatelessWidget {
  final String? pokemonId;
  final String? pokemonName;
  // final List<String>? pokemonTypes;
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
              margin: EdgeInsets.only(
                  top: deviceHeight(context) * 0.1, left: 10, right: 10),
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: colorType1,
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  border: Border.all(color: Colors.black, width: 1.0)),
              child: FittedBox(
                child: Text(
                  '$pokemonName #$pokemonId',
                  style: const TextStyle(fontSize: 25),
                ),
              ),
            )
          ]),
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: SizedBox(
                  height: 150,
                  width: 150,
                  child: CachedNetworkImage(
                      imageUrl: '$pokemonSpriteUrl',
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.question_mark),
                      fit: BoxFit.fill)),
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
                // TODO: both type cards need decrease in width + have their text smaller
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
