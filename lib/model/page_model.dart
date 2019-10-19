import 'question_model.dart';

class Page {
  final String description;
  final List<Question> questions;

  Page({this.description, this.questions});

  factory Page.fromJson(Map<String, dynamic> json) {
    var questionsJson = json['questions'] as List;
    var questions;

    if (questionsJson != null) {
      questions = questionsJson.map((q) => Question.fromJson(q)).toList();
    }

    return Page(
      description: json['description'],
      questions: questions,
    );
  }
}
