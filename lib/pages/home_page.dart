import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/controllers/home_controller.dart';
import 'package:pokedex/widgets/pokemon_home_card.dart';
import 'package:pokedex/widgets/pokemon_search_sheet.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/home';
  final _gridDelegate = const SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 250,
      mainAxisSpacing: 8.0,
      childAspectRatio: 0.8,
      crossAxisSpacing: 8.0);

  void _openSearch(BuildContext context) {
    Get.bottomSheet(PokemonSearchSheet());
  }

  Widget _buildShimmers() {
    List<Widget> list = List<Widget>.generate(
      10,
      (_) => Shimmer.fromColors(
        baseColor: Colors.white,
        highlightColor: Colors.blueGrey,
        child: Container(
          decoration: PokemonHomeCard.boxDecoration(Colors.white),
        ),
      ),
    );

    return GridView(
      shrinkWrap: true,
      gridDelegate: _gridDelegate,
      children: list,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openSearch(context),
        child: const Icon(Icons.search),
      ),
      body: SafeArea(
        child: GetBuilder<HomeController>(
          builder: (_) {
            return CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate([
                    //pokedex logo
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: SizedBox(
                          height: 100,
                          child: Image.asset('assets/images/pokedex_logo.png')),
                    ),

                    //shimmers
                    controller.pokemons.isEmpty
                        ? _buildShimmers()
                        : Container(),
                  ]),
                ),
                SliverGrid(
                  gridDelegate: _gridDelegate,
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      if ((index + 5) == controller.pokemons.length) {
                        controller.fetchNextPage();
                      }

                      return PokemonHomeCard(
                          pokemon: controller.pokemons[index]);
                    },
                    childCount: controller.pokemons.length,
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
