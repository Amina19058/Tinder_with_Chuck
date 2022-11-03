import 'package:flutter/material.dart';
import '../components/app_bar.dart';
import '../components/list.dart';

class FavoriteScreen extends StatelessWidget {
  static const String routeName = '/favorite';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => FavoriteScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: ChuckAppBar(),
        body: ListTileSelect(),
      ),
    );
  }
}
