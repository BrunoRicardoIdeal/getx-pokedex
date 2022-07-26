import 'package:get/get.dart';
import 'package:pokedex/controllers/home_controller.dart';
import 'package:pokedex/repositories/pokemon_repository.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(PokemonRepository()));
  }
}
