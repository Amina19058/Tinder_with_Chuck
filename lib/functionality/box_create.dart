import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class JokeBox {
  var jokeBox;

  JokeBox() {
    create_box();
  }

  Future<void> create_box() async {
    await Hive.initFlutter();
    this.jokeBox = await Hive.openBox('jokeText');
  }
}

class JokeBox2 {
  bool connectionEstablished = false;
  var jokeBox;

  JokeBox2();

  Future<void> createBox() async {
    await Hive.initFlutter();
    jokeBox = await Hive.openBox('jokeText');
    connectionEstablished = true;
  }
}

JokeBox2 myJokeBox = JokeBox2();
