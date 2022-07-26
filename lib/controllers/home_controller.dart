import 'package:get/get.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/repositories/pokemon_repository.dart';

class HomeController extends GetxController {
  final PokemonRepository repository;
  HomeController(this.repository);

  List<Pokemon> pokemons = [];
  // Pokemon? currentPokemon;
  int currentPage = 0;
  RxBool isSearching = false.obs;

  @override
  void onInit() async {
    await fetchNextPage();
    super.onInit();
  }

  Future<void> fetchNextPage() async {
    final response = await repository.fetchNextPage(currentPage: currentPage);
    pokemons.addAll(response);
    currentPage++;

    update();
  }

  Future<Pokemon> findByNameOrId(String searchTerm) async {
    Pokemon poke;

    isSearching.value = true;
    update();
    try {
      poke = await repository.findByNameOrId(searchTerm: searchTerm);
    } finally {
      isSearching.value = false;
    }

    update();

    return poke;
  }
}
