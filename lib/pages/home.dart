import 'package:flutter/material.dart';
import '../components/app_bar.dart';
import '../functionality/swipe.dart';

class HomeScreen extends StatelessWidget {
  // For routing:
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => HomeScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: ChuckAppBar(),
      body: SwipeInterface(),
    ));
  }
}
