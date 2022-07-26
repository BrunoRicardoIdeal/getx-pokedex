// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class PokemonDetailCard extends StatelessWidget {
  final Widget child;
  const PokemonDetailCard({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: child,
      ),
    );
  }
}
