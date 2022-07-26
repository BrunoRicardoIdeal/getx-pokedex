import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/controllers/pokemon_details_controller.dart';
import 'package:pokedex/utils/app_colors.dart';
import 'package:pokedex/widgets/pokemon_detail_carousel.dart';
import 'package:pokedex/widgets/pokemon_home_card.dart';
import 'package:pokedex/widgets/pokemon_moves_wrap.dart';
import 'package:pokedex/widgets/pokemon_stats_indicator.dart';
import 'package:pokedex/widgets/pokemon_types_wrap.dart';

class PokemonDetailsPage extends GetView<PokemonDetailsController> {
  static const String routeName = '/pokedetail';

  const PokemonDetailsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = AppColors.pokemonColorByType(
        controller.currentPokemon.value.types![0].type!.name!.capitalizeFirst!);

    BoxDecoration boxDeco = PokemonHomeCard.boxDecoration(color);

    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text(
            controller.currentPokemon.value.name!.capitalizeFirst!,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      backgroundColor: color,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 15.0,
            ),
            Center(
              child: Container(
                height: 250,
                decoration: boxDeco,
                child: const PokemonDetailCarousel(),
              ),
            ),
            SizedBox(
              height: 50,
              child: PokemonTypesWrap(pokemon: controller.currentPokemon.value),
            ),
            SizedBox(
              height: 230,
              child: Obx(
                () => CarouselSlider(
                  options: CarouselOptions(
                    enableInfiniteScroll: false,
                    enlargeCenterPage: true,
                    padEnds: true,
                  ),
                  items: [
                    PokemonStatsIndicator(
                        pokemon: controller.currentPokemon.value),
                    const PokemonMovesWrap(),
                  ],
                ),
              ),
              // Obx(
              //   () => ListView(
              //     shrinkWrap: true,
              //     scrollDirection: Axis.horizontal,
              //     children: [
              //       PokemonStatsIndicator(
              //           pokemon: controller.currentPokemon.value),
              //       const PokemonMovesWrap(),
              //     ],
              //   ),
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
