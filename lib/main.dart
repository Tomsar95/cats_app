import 'package:cats_app/features/cats/presentation/pages/home_page.dart';
import 'package:cats_app/features/core/utils/custom_colors.dart';
import 'package:cats_app/features/core/utils/custom_navigator.dart';
import 'package:flutter/material.dart';

import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catbreeds',
      theme: ThemeData(primaryColor: CustomColors.black),
      home: const HomePage(),
      onGenerateRoute: CustomNavigator.routes,
      onUnknownRoute: (_) => defaultRoute(const HomePage()),
    );
  }
}