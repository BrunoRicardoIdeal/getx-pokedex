// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/models/pokemon_evolution_chain.dart';
import 'package:pokedex/models/pokemon_move_detail.dart';
import 'package:pokedex/models/pokemon_species.dart';

class PokemonData {
  String name;
  double height;
  double weight;
  late PokemonSpecies species;
  List<String> types;
  List<Stats> stats;
  List<MoveDetail> moves;
  List<String> evolutions;
  PokemonData({
    this.name = '',
    this.height = 0,
    this.weight = 0,
    this.types = const [],
    this.stats = const [],
    this.moves = const [],
    this.evolutions = const [],
  }) {
    species = PokemonSpecies();
  }

  String get getAbout {
    const max = 3;

    String result = '';
    final flavors = species.flavorTextEntries!
        .where((f) => f.language!.name == 'en')
        .toList();

    int qt = 1;
    for (var flavor in flavors) {
      if (qt == max) break;
      result += '\n${flavor.flavorText!}';
      qt++;
    }

    return result;
  }

  factory PokemonData.fromPokemon(Pokemon poke) {
    return PokemonData(
        height: poke.height! / 10,
        weight: poke.weight! / 10,
        types: poke.types?.map((e) => e.type!.name!).toList() ?? [],
        name: poke.name!,
        stats: poke.stats!);
  }

  void loadEvolutions(PokemonEvolutionChain chain) {
    final first = chain.chain!.species!.name!;
    List<String> evos = [];

    evos.add(first);

    List<EvolvesTo> evoList = chain.chain?.evolvesTo ?? [];
    for (var evoTo in evoList) {
      evos.add(evoTo.species!.name!);

      var innerEvo = evoTo.evolvesTo;
      if (innerEvo != null) {
        for (var inner in innerEvo) {
          String innerName = inner.species!.name!;
          evos.add(innerName);
        }
      }
    }

    evolutions.addAll(evos);
  }
}
