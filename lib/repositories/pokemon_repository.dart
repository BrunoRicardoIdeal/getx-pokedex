import 'package:pokedex/api/move_api.dart';
import 'package:pokedex/api/pokemon_api.dart';
import 'package:pokedex/constants/api_constants.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/models/pokemon_data.dart';
import 'package:pokedex/models/pokemon_evolution_chain.dart';
import 'package:pokedex/models/pokemon_move_detail.dart';

class PokemonRepository {
  final PokemonApi _api = PokemonApi();
  final MoveApi _moveApi = MoveApi();

  Future<List<Pokemon>> fetchNextPage({int currentPage = 0}) async {
    final offset = currentPage * kPageItemsCount;
    final pageItems = await _api.fetchPage(offset: offset);
    final list = await _api.fetchPokeList(results: pageItems);

    return list;
  }

  Future<Pokemon> findByNameOrId({required String searchTerm}) async {
    final pokemon = await _api.getByNameOrId(searchTerm);
    return pokemon;
  }

  Future<PokemonEvolutionChain> getEvolutionChain(Pokemon pokemon) async {
    final species = await _api.getSpeciesDetail(pokemon);
    final chain = await _api.getEvolutionChain(species);

    return chain;
  }

  Future<List<MoveDetail>> getMoves(Pokemon pokemon) async {
    List<MoveDetail> moves = [];
    for (var move in pokemon.moves!) {
      final detail = await _moveApi.getMoveDetail(move);
      moves.add(detail);
    }
    return moves;
  }

  Future<PokemonData> getPokemonData(Pokemon pokemon) async {
    PokemonData pokeData = PokemonData.fromPokemon(pokemon);
    pokeData.moves = await getMoves(pokemon);
    pokeData.species = await _api.getSpeciesDetail(pokemon);

    final chain = await _api.getEvolutionChain(pokeData.species);
    pokeData.loadEvolutions(chain);

    return pokeData;
  }
}
