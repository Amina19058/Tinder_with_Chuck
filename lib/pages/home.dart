import 'package:flutter/material.dart';
import 'package:tinder_with_chuck/parser.dart';
import '../components/app_bar.dart';
import '../components/joke_card.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState(){
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {

  var jokeText = [
    'Welcome to Tinder with Chuck!\n'
        'Here you can find a lot funny jokes about Chuck Norris.\n'
        'Try to swipe left to dislike card.',
    'Try to swipe right to put the\n'
        'like to a joke and it will be saved!'
  ];
  var jokeIndex = 0;

  void changeJoke() {
    setState(() {
      if (jokeText.length > 10) {
        jokeText.removeAt(0);
      }
      http.get(Uri.parse("https://api.chucknorris.io/jokes/random"))
          .then((resp) => {
        jokeText.add(
            Joke.fromJson(convert.jsonDecode(resp.body)).value)});
      jokeIndex = jokeText.length - 2;
    });
  }

  @override
  void initState() {
    changeJoke();
    super.initState();
  }

  double swipeThreshold = 100.0;

  void evaluateSwipe(dx) {
    if (dx > swipeThreshold) {
      likeProfile();
    } else if (dx < -swipeThreshold) {
      doNotLikeProfile();
    }
  }

  void likeProfile() {
    increaseStackCounter();
  }

  void doNotLikeProfile() {
    increaseStackCounter();
  }

  void increaseStackCounter() {
    changeJoke();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: ChuckAppBar(),
        body: LayoutBuilder(
            builder: (context, constraints) => Draggable(
              child: JokeCard(text: jokeText[jokeIndex]),
              feedback: JokeCard(text: jokeText[jokeIndex]),
              childWhenDragging: JokeCard(text: jokeText[jokeIndex+1]),
              onDragEnd: (details) => evaluateSwipe(details.offset.dx),
            )),
        // bottomSheet: Buttons(like: changeJoke, dislike: changeJoke),
      ),
    );
  }
}