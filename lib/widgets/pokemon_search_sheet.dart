import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/controllers/home_controller.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/pages/pokemon_details_page.dart';

class PokemonSearchSheet extends StatelessWidget {
  PokemonSearchSheet({Key? key}) : super(key: key);

  final _searchController = TextEditingController();
  final _searchKey = GlobalKey<FormState>();
  final controller = Get.find<HomeController>();

  Future<void> _doSearch(BuildContext context) async {
    FocusScope.of(context).unfocus();

    if (!_searchKey.currentState!.validate()) return;

    String text = _searchController.text.toLowerCase();
    _searchController.clear();

    Pokemon? pokemon;
    try {
      pokemon = await controller.findByNameOrId(text);
    } catch (e) {
      Get.defaultDialog(
        title: 'Pokémon not found',
        middleText: e.toString(),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('OK'),
          ),
        ],
      );

      return;
    }

    Get.offAndToNamed(PokemonDetailsPage.routeName, arguments: [pokemon]);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _searchKey,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        height: 180,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 5.0,
            ),
            Container(
              width: 80.0,
              height: 5.0,
              color: Colors.grey,
            ),
            TextFormField(
              controller: _searchController,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Must not be empty';
                }
                return null;
              },
              autofocus: true,
              decoration: const InputDecoration(
                labelText: 'Which pokemon?',
                hintText: 'Ex: Totodile or 158',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            SizedBox(
              height: 50,
              width: 240,
              child: Obx(() => ElevatedButton(
                    onPressed: () => _doSearch(context),
                    child: controller.isSearching.value
                        ? const Center(
                            child: CircularProgressIndicator(
                            color: Colors.white,
                          ))
                        : const Text('Search'),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
