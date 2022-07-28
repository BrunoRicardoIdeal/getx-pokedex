// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/widgets/pokemon_detail_card.dart';

class PokemonAboutCard extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonAboutCard({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  String getWeight() {
    int wHectogram = pokemon.weight!;
    double wKg = wHectogram / 10;

    return wKg.toString().replaceAll('.', ',');
  }

  String getHeight() {
    int hDecimeter = pokemon.height!;
    double wMeter = hDecimeter / 10;

    return wMeter.toString().replaceAll('.', ',');
  }

  @override
  Widget build(BuildContext context) {
    String w = getWeight();
    String h = getHeight();

    return PokemonDetailCard(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Weight: $w kg'),
          Text('Height: $h m'),
        ],
      ),
    ));
  }
}
