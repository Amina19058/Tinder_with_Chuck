import 'package:flutter/material.dart';

class ChuckPic extends StatelessWidget {
  const ChuckPic({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 3,
          )
        ],
        image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            colorFilter: ColorFilter.mode(Color(0xF5ABAFCC), BlendMode.screen
                //(0xB6FDFDFD)white54.withOpacity(0.6)
                ),
            fit: BoxFit.cover),
      ),
    );
  }
}
