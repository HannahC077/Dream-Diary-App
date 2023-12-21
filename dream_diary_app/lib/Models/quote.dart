import 'dart:convert';

class Quote {
  final int id;
  final String text;
  final String author;

  Quote(this.id, this.text, this.author);

  factory Quote.fromJson(String body) {
    var parsedJson = jsonDecode(body);
    return Quote(parsedJson["id"], parsedJson["text"], parsedJson["author"]);
  }

  factory Quote.fromJsonList(dynamic json) {
    return Quote(json["id"], json["text"], json["author"]);
  }
}
