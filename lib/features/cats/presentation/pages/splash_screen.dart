import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/custom_navigator.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(CustomRoutes.home);
    });

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Catbreeds',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 20.0),
              SvgPicture.asset(
                'assets/splash_cat.svg',
                width: 150.0, // Ajusta el tamaño de la imagen si es necesario
                height: 150.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}