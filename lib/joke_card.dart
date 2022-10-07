import 'package:flutter/material.dart';
import 'package:tinder_with_chuck/picture.dart';
import 'package:tinder_with_chuck/text_pattern.dart';
import 'joke_text.dart';


class JokeCard extends StatelessWidget {
  JokeCard({super.key, required this.text});

  final text;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
            left: 20,
            top: 10,
            right: 20
        ),
        child: Container(
          height: MediaQuery.of(context).size.height / 1.4,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              ChuckPic(),
              TextPattern(textValue: text)
            ],
          ),
        )
    );
  }

}



// class ChuckNorrisTinder extends StatefulWidget{
//   @override
//   State<StatefulWidget> createState() {
//     return ChuckNorrisTinderState();
//   }
//
// }
// class ChuckNorrisTinderState extends State<ChuckNorrisTinder> {
//
//   var jokes = [
//     {'question': 'Question1', 'answer': 'Answer1'},
//     {'question': 'Question2', 'answer': 'Answer2'},
//     {'question': 'Question3', 'answer': 'Answer3'},
//   ];
//
//   var jokeIndex = 0;
//
//   changeJokeIndex(String direction){
//     if (direction=='next') {
//       if (jokeIndex != jokes.length - 1) {
//         setState(() {
//           jokeIndex++;
//         });
//       }
//       else {
//         jokeIndex = 0;
//       }
//     }
//     else if (direction=='prev') {
//       if (jokeIndex != 0) {
//         setState(() {
//           jokeIndex--;
//         });
//       }
//       else {
//         jokeIndex = jokes.length - 1;
//       }
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Joke(joke: jokes[jokeIndex]['question'] as String),
//               Button(changeJokeIndex: changeJokeIndex),
//             ],
//           )
//         )
//       )
//     );
//   }
// }