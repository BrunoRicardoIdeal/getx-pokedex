import 'package:get/get.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/models/pokemon_evolution_chain.dart';
import 'package:pokedex/models/pokemon_move_detail.dart';
import 'package:pokedex/repositories/pokemon_repository.dart';

class PokemonDetailsController extends GetxController {
  final PokemonRepository repository;
  RxBool isLoadingMoves = false.obs;
  RxString firstSelected = ''.obs;

  Map<String, List<MoveDetail>> movesMap = {};

  Rx<Pokemon> currentPokemon = Pokemon().obs;
  RxList<Pokemon> evolutions = <Pokemon>[].obs;

  int get firstImgIndex =>
      evolutions.indexWhere((p) => p.name == firstSelected.value);

  PokemonDetailsController(this.repository);

  @override
  Future<void> onInit() async {
    await changeCurrentPokemon(Get.arguments[0] as Pokemon);
    firstSelected.value = currentPokemon.value.name!;
    super.onInit();
  }

  Future<void> changeCurrentPokemon(Pokemon pokemon) async {
    currentPokemon.value = pokemon;
  }

  Future<List<MoveDetail>> getMovesDetails(Pokemon pokemon) async {
    isLoadingMoves.value = true;
    try {
      final name = pokemon.name!;
      List<MoveDetail>? moves = movesMap[name];

      if (moves != null) {
        return moves;
      }

      moves = await repository.getMoves(pokemon);

      movesMap.addAll({name: moves});

      return moves;
    } finally {
      isLoadingMoves.value = false;
    }
  }

  Future<void> fetchEvolutions() async {
    final chain = await repository.getEvolutionChain(currentPokemon.value);
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

    for (var name in evos) {
      Pokemon pokemon = await repository.findByNameOrId(searchTerm: name);
      evolutions.add(pokemon);
    }
  }
}
