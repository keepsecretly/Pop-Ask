import 'question_model.dart';

class Page {
  final String description;
  final List<Question> questions;

  Page({this.description, this.questions});

  factory Page.fromJson(Map<String, dynamic> json) {
    return Page(
      description: json['description'],
      questions: json['questions'].map((p) => Page.fromJson(p)).toList(),
    );
  }
}
