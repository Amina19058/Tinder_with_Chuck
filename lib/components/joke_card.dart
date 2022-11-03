import 'package:flutter/material.dart';
import 'package:tinder_with_chuck/components/picture.dart';
import 'package:tinder_with_chuck/styles/text_pattern.dart';

class JokeCard extends StatelessWidget {
  JokeCard({super.key, required this.text});

  final text;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
        child: Container(
          height: MediaQuery.of(context).size.height / 1.2,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [ChuckPic(), TextPattern(textValue: text)],
          ),
        ));
  }
}
