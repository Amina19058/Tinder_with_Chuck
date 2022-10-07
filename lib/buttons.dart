import 'package:flutter/material.dart';

class Button extends StatelessWidget {

  final double width;
  final double height;
  final Color color;
  final IconData icon;


  Button({required this.width, required this.height, required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white10,
          boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(50),
            spreadRadius: 4,
            blurRadius: 4,
            offset: Offset(3, 3),
          )
        ]
      ),
      child: Icon(
        Icons.clear_rounded,
        color: Colors.grey,)
    );
  }
}

// class Button extends StatelessWidget {
//
//   final Function(String) changeJokeIndex;
//
//   Button({required this.changeJokeIndex});
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         FloatingActionButton(
//           onPressed: () {
//             changeJokeIndex('prev');
//           },
//           child: Icon(Icons.arrow_back),
//           backgroundColor: Colors.deepOrange,
//         ),
//         FloatingActionButton(
//           onPressed: () {changeJokeIndex('next');},
//           child: Icon(Icons.arrow_forward),
//         )
//       ],
//     );
//   }
// }