import 'package:pokedex/models/pokemon.dart';

class PokeUtils {
  static String shortStatName(String longName) {
    longName = longName.toLowerCase();
    switch (longName) {
      case 'hp':
        return 'HP';
      case 'attack':
        return 'ATK';
      case 'defense':
        return 'DEF';
      case 'special-attack':
        return 'SP-ATK';
      case 'special-defense':
        return 'SP-DEF';
      case 'speed':
        return 'SPD';
      default:
        return '';
    }
  }

  static String getPokeImgUrl(Sprites sprites) {
    String? url = '';

    url = sprites.other?.dreamWorld?.frontDefault ?? sprites.frontDefault;

    return url ?? '';
  }
}
