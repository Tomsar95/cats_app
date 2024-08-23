import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/custom_colors.dart';
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
        backgroundColor: CustomColors.lightGray,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 100.0),
              Text(
                'Catbreeds',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 100.0),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 100.0, bottom: 50),
                child: SvgPicture.asset(
                  'assets/images/splash_cat.svg',
                  width: 150.0,
                  height: 150.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}