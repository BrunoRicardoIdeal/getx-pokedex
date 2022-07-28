import 'dart:math';

import 'package:flutter/material.dart';

class PokemonMovesShimmer extends StatelessWidget {
  const PokemonMovesShimmer({Key? key}) : super(key: key);

  Widget get moveContainer => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.grey,
          ),
          height: 25,
          width: Random().nextInt(30).toDouble() + 50,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        children: List<Widget>.generate(20, (index) => moveContainer),
      ),
    );
  }
}
