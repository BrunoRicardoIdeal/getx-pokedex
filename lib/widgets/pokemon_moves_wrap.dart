// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/controllers/pokemon_details_controller.dart';
import 'package:pokedex/models/pokemon_move_detail.dart';
import 'package:pokedex/utils/app_colors.dart';
import 'package:pokedex/widgets/pokemon_detail_card.dart';

class PokemonMovesWrap extends StatelessWidget {
  const PokemonMovesWrap({
    Key? key,
  }) : super(key: key);

  List<Widget> generateMoves(BuildContext context, List<MoveDetail> moves) {
    return List<Widget>.generate(
      moves.length,
      (index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          decoration: BoxDecoration(
            color: AppColors.pokemonColorByType(
                moves[index].type!.name!.capitalizeFirst!),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Text(
            moves[index].name!,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetX<PokemonDetailsController>(
      initState: (_) {},
      builder: (controller) {
        return FutureBuilder<List<MoveDetail>>(
          future: controller.getMovesDetails(controller.currentPokemon.value),
          initialData: const [],
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            final moves = generateMoves(context, snapshot.data);
            return PokemonDetailCard(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: (controller.isLoadingMoves.value ||
                        !snapshot.hasData ||
                        snapshot.data.isEmpty)
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        child: Wrap(
                          children: moves,
                        ),
                      ),
              ),
            );
          },
        );
      },
    );

    // return PokemonDetailCard(
    //   child: Padding(
    //     padding: const EdgeInsets.all(8.0),
    //     child: SingleChildScrollView(
    //       physics: const BouncingScrollPhysics(),
    //       scrollDirection: Axis.vertical,
    //       child: GetX<PokemonDetailsController>(
    //         builder: (_) {
    //           final moves = generateMoves(context);
    //           return Wrap(
    //             children: moves,
    //           );
    //         },
    //       ),
    //     ),
    //   ),
    // );
  }
}
