import 'package:flutter/material.dart';
import 'package:tinder_with_chuck/joke_text.dart';
import 'package:tinder_with_chuck/parser.dart';
import 'joke_card.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

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

class HomeScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState(){
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {

  var jokeText = 'Welcome!';

  void changeJoke() {
    setState(() {
      http.get(Uri.parse("https://api.chucknorris.io/jokes/random"))
          .then((resp) => {jokeText = Joke.fromJson(convert.jsonDecode(resp.body)).value});
    });
  }

  // void changeJoke() {
  //   setState(() {
  //     jokeText = Joke.fromJson(
  //         convert.jsonDecode(http.get(Uri.parse(
  //             'https://api.chucknorris.io/jokes/random'
  //         )).body)
  //     ).value;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: ChuckAppBar(),
          body: JokeCard(text: jokeText),
          bottomSheet: Buttons(like: changeJoke, dislike: changeJoke),
    )
    );
  }
}

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

class Buttons extends StatelessWidget {

  const Buttons({super.key, required this.like, required this.dislike});

  final VoidCallback like;
  final VoidCallback dislike;

  //
  // @override
  // Widget build(BuildContext context) {
  //   return SafeArea(
  //       child: Scaffold(
  //         appBar: AppBar(
  //           centerTitle: true,
  //           title: Text(widget.title),
  //         ),
  //         body: Center(
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: <Widget>[
  //               JokeCard(text: _joke),
  //             ],
  //           ),
  //         ),
  //         bottomSheet: Buttons(like: _updateJoke, dislike: _updateJoke),
  //       ));
  // }

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
              // onPressed: (){
              //   like;
              // },
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
