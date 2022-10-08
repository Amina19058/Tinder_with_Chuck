import 'package:flutter/material.dart';

class ButtonStyle extends StatelessWidget {

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

class Buttons extends StatelessWidget {

  const Buttons({super.key, required this.like, required this.dislike});

  final VoidCallback like;
  final VoidCallback dislike;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: FloatingActionButton(
              onPressed: dislike,
              tooltip: 'dislike',
              child: Icon(
                  Icons.arrow_left_rounded,
                  size: 60
              ),
              backgroundColor: Colors.orange,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: FloatingActionButton(
              onPressed: like,
              tooltip: 'like',
              child: Icon(
                  Icons.arrow_right_rounded,
                  size: 60
              ),
              backgroundColor: Colors.orange,
            ),
          )
        ]
    );
  }
}
