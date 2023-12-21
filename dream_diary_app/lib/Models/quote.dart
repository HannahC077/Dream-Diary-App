import 'dart:convert';

class Quote {
  final int id;
  final String text;

  Quote(this.id, this.text);

  factory Quote.fromJson(String body) {
    var parsedJson = jsonDecode(body);
    return Quote(parsedJson["id"], parsedJson["text"]);
  }

  factory Quote.fromJsonList(dynamic json) {
    return Quote(json["id"], json["text"]);
  }
}
