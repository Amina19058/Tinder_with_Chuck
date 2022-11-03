import 'package:flutter/material.dart';

class TextPattern extends StatelessWidget {
  final String textValue;

  const TextPattern({super.key, required this.textValue});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(20.0),
        child: Text(
          textValue,
          style: Theme.of(context).textTheme.bodyText1,
          textAlign: TextAlign.center,
        ));
  }
}
