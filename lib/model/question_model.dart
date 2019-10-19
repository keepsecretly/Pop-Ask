import 'required_model.dart';

class Question {
  final Required required;

  Question({this.required});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      required: Required.fromJson(json['required']),
    );
  }
}
