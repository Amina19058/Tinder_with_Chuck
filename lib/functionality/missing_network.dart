import 'package:flutter/material.dart';
import '../components/joke_card.dart';

class MissingNetworkWarning extends StatelessWidget {
  const MissingNetworkWarning({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: MediaQuery.of(context).size.width,
      color: Colors.red,
      child: const Center(
        child: Text(
          'No Internet Connection',
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
      ),
    );
  }
}

class MissingNetworkChuck extends StatelessWidget {
  const MissingNetworkChuck({Key? key}) : super(key: key);

  final respectfulRequest =
      'Chuck Norris usually doesn\'t ask, but please turn on the Internet if you want it nice.';

  @override
  Widget build(BuildContext context) {
    return JokeCard(
      text: respectfulRequest,
    );
  }
}
