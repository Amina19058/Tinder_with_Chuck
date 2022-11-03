import 'package:flutter/material.dart';

class ChuckTextButton extends StatelessWidget {
  const ChuckTextButton({super.key, required this.state});

  final bool state;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: !state
          ? const Text(
              'select all',
              style: TextStyle(color: Colors.white),
            )
          : const Text(
              'unselect all',
              style: TextStyle(color: Colors.white),
            ),
    );
  }
}
