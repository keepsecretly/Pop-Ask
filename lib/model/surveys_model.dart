import 'package:pop_ask/model/survey_model.dart';

class Surveys {
  final List<Survey> surveys;

  Surveys({this.surveys});

  factory Surveys.fromJson(Map<String, dynamic> json) {
    var data = json['data'] as List;

    return Surveys(
      surveys: data.map((d) => Survey.fromJson(d)).toList(),
    );
  }
}
