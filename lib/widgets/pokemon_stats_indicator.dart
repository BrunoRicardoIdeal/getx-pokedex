// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pokedex/constants/poke_constants.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/utils/poke_utils.dart';
import 'package:pokedex/widgets/pokemon_detail_card.dart';

class PokemonStatsIndicator extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonStatsIndicator({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  String _getShortName(String name) {
    name = PokeUtils.shortStatName(name);
    const kMax = 6;

    final length = name.length;
    final diff = kMax - length;

    for (var i = 0; i < diff; i++) {
      name = '$name ';
    }

    return name;
  }

  List<Widget> generateIndicators(BuildContext context) {
    final stats = pokemon.stats!;
    return List<Widget>.generate(stats.length, (index) {
      final name = stats[index].stat!.name!;
      final value = stats[index].baseStat!;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                _getShortName(name),
                style: const TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              flex: 4,
              child: LinearPercentIndicator(
                leading: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                ),
                barRadius: const Radius.circular(18),
                lineHeight: 14.0,
                percent: value / kMaxStats,
                progressColor: Theme.of(context).primaryColor,
                curve: Curves.easeIn,
                animation: true,
                center: Text(
                  value.toString(),
                  style: const TextStyle(
                      color: Color.fromARGB(255, 98, 91, 91),
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final indicators = generateIndicators(context);

    return PokemonDetailCard(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: SingleChildScrollView(child: Column(children: indicators)),
      ),
    );
  }
}
