// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/utils/app_images.dart';

class PokemonTypesWrap extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonTypesWrap({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
    final types = pokemon.types;
    if (types == null || types.isEmpty) return Container();

    for (var type in types) {
      String name = type.type!.name!;

      final container = Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(200),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                  height: 20.0,
                  width: 20.0,
                  child: AppImages.pokemonTypeImage(name)),
              const SizedBox(
                width: 2,
              ),
              Text(
                name,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      );

      list.add(container);
    }

    return Wrap(
      alignment: WrapAlignment.center,
      children: list,
    );
  }
}
