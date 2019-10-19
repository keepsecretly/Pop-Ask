import 'page_model.dart';

class Survey {
  final String id;
  final String title;

  final List<Page> pages;

  Survey({this.id, this.title, this.pages});

  factory Survey.fromJson(Map<String, dynamic> json) {
    var pagesJson = json['pages'] as List;
    var pages;

    if (pagesJson != null) {
      pages = pagesJson.map((p) => Page.fromJson(p)).toList();
    }

    return Survey(
      id: json['id'],
      title: json['title'],
      pages: pages,
    );
  }
}
