import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/utils/app_colors.dart';
import 'package:pokedex/utils/poke_utils.dart';

class AppImages {
  static Image pokemonTypeImage(String type) {
    String path = 'assets/images/poke_types/$type.png';
    return Image.asset(
      path,
      color: AppColors.pokemonColorByType(type.capitalizeFirst!),
    );
  }

  static Widget pokeImage(Pokemon pokemon) {
    Sprites? sprites = pokemon.sprites;

    Icon pokeIcon = const Icon(Icons.catching_pokemon);
    if (sprites == null) {
      return pokeIcon;
    }

    String url = PokeUtils.getPokeImgUrl(sprites);

    if (url.isEmpty) {
      return pokeIcon;
    }

    if (url.contains('.png')) {
      return Image.network(url);
    }

    return SvgPicture.network(
      url,
      semanticsLabel: 'Which pokémon?',
      placeholderBuilder: (BuildContext context) => const Center(
        child: SizedBox(
          height: 30,
          width: 30,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
