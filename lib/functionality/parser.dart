import 'dart:async';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Joke {
  final String iconUrl;
  final String id;
  final String url;
  final String value;

  const Joke({
    required this.iconUrl,
    required this.id,
    required this.url,
    required this.value,
  });

  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(
      iconUrl: json['icon_url'],
      id: json['id'],
      url: json['url'],
      value: json['value'],
    );
  }
}

Future<Joke> fetchJoke() async {
  final response =
      await http.get(Uri.parse('https://api.chucknorris.io/jokes/random'));

  if (response.statusCode == 200) {
    return Joke.fromJson(convert.jsonDecode(response.body));
  } else {
    throw Exception('Failed to load joke');
  }
}
