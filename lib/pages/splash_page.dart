import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/pages/home_page.dart';

class SplashPage extends StatefulWidget {
  static const routeName = '/';
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1))
        .then((value) => Get.offAndToNamed(HomePage.routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor.withAlpha(50),
      body: const Center(child: CircularProgressIndicator()),
    );
  }
}
