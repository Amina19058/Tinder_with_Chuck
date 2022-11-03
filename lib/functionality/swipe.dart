import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:tinder_with_chuck/components/joke_card.dart';
import 'parser.dart';

class SwipeInterface extends StatefulWidget {
  const SwipeInterface({super.key});

  @override
  State<StatefulWidget> createState() => _SwipeInterfaceState();
}

class _SwipeInterfaceState extends State<SwipeInterface> {
  var jokeText = [
    'Welcome to Tinder with Chuck!\n'
        'Here you can find a lot funny jokes about Chuck Norris.\n'
        'Try to swipe left to dislike card.',
    'Try to swipe right to put the\n'
        'like to a joke and it will be saved!'
  ];
  var jokeIndex = 0;
  var favoriteJokes = Hive.box('favoriteJokes');

  void changeJoke() {
    setState(() {
      if (jokeText.length > 10) {
        jokeText.removeAt(0);
      }
      http.get(Uri.parse("https://api.chucknorris.io/jokes/random")).then(
          (resp) => {
                jokeText.add(Joke.fromJson(convert.jsonDecode(resp.body)).value)
              });
      jokeIndex = jokeText.length - 2;
    });
  }

  @override
  void initState() {
    changeJoke();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Draggable(
        feedback: JokeCard(text: jokeText[jokeIndex]),
        childWhenDragging: JokeCard(
          text: jokeText[jokeIndex + 1],
        ),
        child: JokeCard(
          text: jokeText[jokeIndex],
        ),
        onDragEnd: (details) =>
            evaluateSwipe(details.offset.dx, jokeText[jokeIndex]),
      ),
    );
  }

  double swipeThreshold = 100.0;

  void evaluateSwipe(dx, joke) {
    if (dx > swipeThreshold) {
      likeJoke(jokeText[jokeIndex]);
    } else if (dx < -swipeThreshold) {
      doNotLikeJoke();
    }
  }

  Future<void> likeJoke(joke) async {
    favoriteJokes.add(jokeText[jokeIndex]);
    increaseStackCounter();
  }

  void doNotLikeJoke() {
    increaseStackCounter();
  }

  void increaseStackCounter() {
    changeJoke();
  }
}
