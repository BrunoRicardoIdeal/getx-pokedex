import 'package:flutter/material.dart';

class PokemonCardShimmer extends StatelessWidget {
  const PokemonCardShimmer({Key? key}) : super(key: key);

  static BoxDecoration boxDecoration(Color color) => BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(40)),
        color: color,
      );

  Widget get typeShimmer => Expanded(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colors.grey,
          ),
          height: 30,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.grey,
                ),
                height: 30,
                width: 50,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Container(
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
              ),
            ),
            Row(
              children: [
                typeShimmer,
                typeShimmer,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
