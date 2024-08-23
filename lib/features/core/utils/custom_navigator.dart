import 'package:cats_app/features/core/utils/custom_arguments.dart';
import 'package:flutter/material.dart';

import '../../cats/presentation/pages/cat_details_page.dart';
import '../../cats/presentation/pages/home_page.dart';

class CustomNavigator {
  static Route<dynamic> routes(RouteSettings settings) {
    final route = settings.name?.split('/');
    if (route != null) {
      switch (route[0]) {
        case CustomRoutes.home:
          return defaultRoute(const HomePage());
        case CustomRoutes.catsDetails:
          final CatDetailsArguments args =
              settings.arguments as CatDetailsArguments;
          return defaultRoute(CatDetailsPage(
            cat: args.cat,
          ));
        default:
          return defaultRoute(const HomePage());
      }
    }
    return defaultRoute(const HomePage());
  }
}

MaterialPageRoute defaultRoute<T extends Widget>(T child) {
  return MaterialPageRoute<T>(builder: (BuildContext context) => child);
}

class CustomRoutes {
  static const String home = "home";
  static const String catsDetails = "detail";
}
