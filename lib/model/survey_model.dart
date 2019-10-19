import 'page_model.dart';

class Survey {
  final String title;

  final List<Page> pages;

  Survey({this.title, this.pages});

  factory Survey.fromJson(Map<String, dynamic> json) {
    return Survey(
      title: json['title'],
      pages: json['pages'],
    );
  }
}