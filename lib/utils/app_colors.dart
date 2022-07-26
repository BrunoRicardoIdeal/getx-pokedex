import 'package:flutter/material.dart';

class AppColors {
  static Color pokemonColorByType(String type) {
    switch (type) {
      case 'Normal':
        return const Color(0xFFA7A877);
      case 'Fire':
        return const Color(0xFFFB6C6C);
      case 'Water':
        return const Color(0xFF77BDFE);
      case 'Grass':
        return const Color(0xFF48D0B0);
      case 'Electric':
        return const Color(0xFFFFCE4B);
      case 'Ice':
        return const Color(0xFF99D7D8);
      case 'Fighting':
        return const Color(0xFFC03128);
      case 'Poison':
        return const Color(0xFF9F419F);
      case 'Ground':
        return const Color(0xFFE1C068);
      case 'Flying':
        return const Color(0xFFA890F0);
      case 'Psychic':
        return const Color(0xFFF95887);
      case 'Bug':
        return const Color(0xFFA8B91F);
      case 'Rock':
        return const Color(0xFFB8A038);
      case 'Ghost':
        return const Color(0xFF705998);
      case 'Dark':
        return const Color(0xFF6F5848);
      case 'Dragon':
        return const Color(0xFF7138F8);
      case 'Steel':
        return const Color(0xFFB8B8D0);
      case 'Fairy':
        return const Color(0xFFA890F0);
      default:
        return Colors.grey;
    }
  }
}
