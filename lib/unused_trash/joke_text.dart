import 'package:flutter/material.dart';
import 'package:tinder_with_chuck/parser.dart';
import 'package:tinder_with_chuck/styles/text_pattern.dart';

class JokeText extends StatefulWidget {
  const JokeText({super.key});

  @override
  State<JokeText> createState() => _JokeTextState();
}

class _JokeTextState extends State<JokeText> {
  late Future<Joke> futureJoke;

  @override
  void initState() {
    super.initState();
    futureJoke = fetchJoke();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<Joke>(
        future: futureJoke,
        builder: (context, joke) {
          if (joke.hasData) {
            return TextPattern(textValue: joke.data!.value);
          } else if (joke.hasError) {
            return TextPattern(textValue: '${joke.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
