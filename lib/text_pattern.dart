import 'package:flutter/material.dart';

class TextPattern extends StatelessWidget {

  final String textValue;

  const TextPattern({super.key, required this.textValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
        child: Text (
                textValue,
                style: const TextStyle(
                    color: Colors.black54,
                    fontFamily: 'Nunito',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 6.0,
                      color: Colors.black26,
                      offset: Offset(1.0, 1.0),
                    ),
                    Shadow(
                      color: Colors.black12,
                      blurRadius: 10.0,
                      offset: Offset(-5.0, 5.0),
                    ),
                  ],
                ),
              )
          );
  }
}