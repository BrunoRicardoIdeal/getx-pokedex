import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/bindings/home_binding.dart';
import 'package:pokedex/bindings/pokemon_details_binding.dart';
import 'package:pokedex/pages/home_page.dart';
import 'package:pokedex/pages/pokemon_details_page.dart';
import 'package:pokedex/pages/splash_page.dart';

void main() {
  runApp(const PokedexApp());
}

class PokedexApp extends StatelessWidget {
  const PokedexApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashPage.routeName,
      title: 'Pokedex',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      getPages: [
        GetPage(
          name: SplashPage.routeName,
          page: () => const SplashPage(),
        ),
        GetPage(
          name: HomePage.routeName,
          page: () => const HomePage(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: PokemonDetailsPage.routeName,
          page: () => const PokemonDetailsPage(),
          binding: PokemonDetailsBinding(),
        ),
      ],
    );
  }
}
