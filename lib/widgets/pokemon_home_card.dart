import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/pages/pokemon_details_page.dart';
import 'package:pokedex/utils/app_colors.dart';
import 'package:pokedex/utils/app_images.dart';
import 'package:pokedex/widgets/pokemon_types_wrap.dart';

class PokemonHomeCard extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonHomeCard({Key? key, required this.pokemon}) : super(key: key);

  static BoxDecoration boxDecoration(Color color) => BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(40)),
        color: color,
        image: const DecorationImage(
            image: AssetImage('assets/images/pokeback.png'),
            fit: BoxFit.scaleDown,
            opacity: 0.3),
      );

  Color _getCardColor() {
    final types = pokemon.types;
    if (types == null || types.isEmpty) return Colors.grey;

    String type = types[0].type!.name!.capitalizeFirst!;
    final color = AppColors.pokemonColorByType(type);

    return color;
  }

  @override
  Widget build(BuildContext context) {
    Widget pokeImg = AppImages.pokeImage(pokemon);
    Color color = _getCardColor();

    return InkWell(
      onTap: () => Get.toNamed(
        PokemonDetailsPage.routeName,
        arguments: [pokemon],
      ),
      child: Container(
        height: 130,
        width: 180,
        decoration: boxDecoration(color),
        child: Column(
          children: [
            // Name
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  pokemon.name!.capitalizeFirst!,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),

            //Image
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                height: 120,
                child: Hero(tag: 'pokeimg${pokemon.name}', child: pokeImg),
              ),
            ),

            //Types
            Expanded(
              flex: 2,
              child: Center(
                child: PokemonTypesWrap(
                  pokemon: pokemon,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
