import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/controllers/pokemon_details_controller.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/utils/app_images.dart';

class PokemonDetailCarousel extends StatefulWidget {
  const PokemonDetailCarousel({Key? key}) : super(key: key);

  @override
  State<PokemonDetailCarousel> createState() => _PokemonDetailCarouselState();
}

class _PokemonDetailCarouselState extends State<PokemonDetailCarousel> {
  final controller = Get.find<PokemonDetailsController>();
  int _firstImgIndex = 0;
  bool _heroBuilt = false;

  Future<bool> _fetchEvolutions() async {
    await controller.fetchEvolutions();
    _firstImgIndex = controller.firstImgIndex;

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _fetchEvolutions(),
      initialData: false,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData && snapshot.data == true) {
          return GetX<PokemonDetailsController>(
            builder: (_) => CarouselSlider.builder(
              options: CarouselOptions(
                initialPage: _firstImgIndex,
                enableInfiniteScroll: controller.evolutions.length > 1,
                enlargeCenterPage: true,
                padEnds: true,
                viewportFraction: 0.65,
                height: 250,
                onPageChanged: (index, reason) async {
                  await controller
                      .changeCurrentPokemon(controller.evolutions[index]);
                },
              ),
              itemCount: controller.evolutions.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) {
                if (controller.evolutions.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                Pokemon evoPoke = controller.evolutions[itemIndex];
                Widget img = AppImages.pokeImage(evoPoke);
                bool isClicked = itemIndex == _firstImgIndex;
                if (isClicked && !_heroBuilt) {
                  _heroBuilt = true;
                  return Hero(
                    tag: 'pokeimg${controller.firstSelected.value}',
                    child: img,
                  );
                } else {
                  return Container(
                    child: img,
                  );
                }
              },
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
