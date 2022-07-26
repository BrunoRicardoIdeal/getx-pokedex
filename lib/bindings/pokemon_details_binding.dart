import 'package:get/get.dart';
import 'package:pokedex/controllers/pokemon_details_controller.dart';
import 'package:pokedex/repositories/pokemon_repository.dart';

class PokemonDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PokemonDetailsController>(
      () => PokemonDetailsController(
        PokemonRepository(),
      ),
    );
  }
}
