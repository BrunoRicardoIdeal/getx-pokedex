import 'package:dio/dio.dart';
import 'package:pokedex/constants/api_constants.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/models/pokemon_evolution_chain.dart';
import 'package:pokedex/models/pokemon_page_item.dart';
import 'package:pokedex/models/pokemon_page_item_result.dart';
import 'package:pokedex/models/pokemon_species.dart';

class PokemonApi {
  Dio dio = Dio();

  Future<List<PokemonPageItemResult>> fetchPage({int offset = 0}) async {
    String url = '$kPokemonNextPageUrl$offset';

    try {
      final response = await dio.request(url);
      final data = response.data;
      if (data == null) throw 'Poké page not found';

      PokemonPageItem pageItem = PokemonPageItem.fromJson(data);
      if (pageItem.results == null) throw 'Poké results not found';

      List<PokemonPageItemResult> list = [];
      for (var item in pageItem.results!) {
        final itemResult =
            PokemonPageItemResult(name: item.name, url: item.url);
        list.add(itemResult);
      }

      return list;
    } catch (e) {
      throw 'Error getting poké page: ${e.toString()}';
    }
  }

  Future<List<Pokemon>> fetchPokeList(
      {required List<PokemonPageItemResult> results}) async {
    List<Pokemon> list = [];

    for (var result in results) {
      try {
        if (result.url == null) continue;
        final response = await dio.request(result.url!);
        final data = response.data;
        if (data == null) throw 'Poké data not found';

        final pokemon = Pokemon.fromJson(data);
        list.add(pokemon);
      } catch (e) {
        throw 'Error getting poké data: ${e.toString()}';
      }
    }

    return list;
  }

  Future<Pokemon> getByNameOrId(String criteria) async {
    String url = '$kPokemonUrl$criteria';
    try {
      final response = await dio.request(url);
      final data = response.data;
      if (data == null) throw 'Pokémon not found.';

      final pokemon = Pokemon.fromJson(data);
      return pokemon;
    } catch (e) {
      throw 'Error getting pokemon : $criteria';
    }
  }

  Future<PokemonSpecies> getSpeciesDetail(Pokemon pokemon) async {
    String url = pokemon.species!.url!;
    try {
      final response = await dio.request(url);
      final data = response.data;
      if (data == null) throw 'Species not found.';

      final species = PokemonSpecies.fromJson(data);
      return species;
    } catch (e) {
      throw 'Error getting species : ${e.toString()}';
    }
  }

  Future<PokemonEvolutionChain> getEvolutionChain(
      PokemonSpecies species) async {
    String url = species.evolutionChain!.url!;
    try {
      final response = await dio.request(url);
      final data = response.data;
      if (data == null) throw 'Evolution chain not found.';

      final evolutionChain = PokemonEvolutionChain.fromJson(data);
      return evolutionChain;
    } catch (e) {
      throw 'Error getting evolution chain : ${e.toString()}';
    }
  }
}
