import 'package:flutter/material.dart';
import 'package:tinder_with_chuck/pages/home.dart';
import '../pages/favorite.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('Route to: ${settings.name}');

    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case FavoriteScreen.routeName:
        return FavoriteScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(appBar: AppBar(title: Text('error'))),
      settings: RouteSettings(name: '/error'),
    );
  }
}
