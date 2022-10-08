import 'package:flutter/material.dart';
import 'pages/home.dart';

class ChuckNorrisTinder extends StatelessWidget {
  const ChuckNorrisTinder({super.key});

  @override
  Widget build(BuildContext context) {
  return MaterialApp(
    title: "Tinder with Chuck Norris",
    theme: ThemeData(
      brightness: Brightness.dark,
    ),
    home: HomeScreen()
  );
  }
}