import 'package:pop_ask/model/choice_model.dart';
import 'package:pop_ask/model/row_model.dart';

class Answer {
  final List<Row> rows;
  final List<Choice> choices;

  Answer({this.rows, this.choices});

  factory Answer.fromJson(Map<String, dynamic> json) {
    var rows;
    var choices;

    var rowsJson = json['rows'] as List;
    var choicesJson = json['choices'] as List;

    if (rowsJson != null) {
      rows = rowsJson.map((p) => Row.fromJson(p)).toList();
    }

    if (choicesJson != null) {
      choices = choicesJson.map((p) => Choice.fromJson(p)).toList();
    }

    return Answer(
      rows: rows,
      choices: choices,
    );
  }
}
