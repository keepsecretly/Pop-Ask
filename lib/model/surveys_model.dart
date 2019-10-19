import 'package:pop_ask/model/survey_model.dart';

class Surveys {
  final List<Survey> surveys;

  Surveys({this.surveys});

  factory Surveys.fromJson(Map<String, dynamic> json) {
    return Surveys(
      surveys: json['data'],
    );
  }
}
