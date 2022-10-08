import 'package:flutter/material.dart';

class ChuckAppBar extends StatelessWidget with PreferredSizeWidget {
  const ChuckAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Chuck Norris Jokes',
          style: TextStyle(
              fontFamily: 'Nunito'
          ),
        )
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.0);
}