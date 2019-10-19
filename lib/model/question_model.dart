import 'package:pop_ask/model/display_option.dart';

import 'required_model.dart';

class Question {
  final DisplayOption displayOption;
  final Required required;
  final String subType;

  Question({this.displayOption, this.required, this.subType});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      displayOption: DisplayOption.fromJson(json['display_options']),
      required: Required.fromJson(json['required']),
      subType: json['sub_type'],
    );
  }
}
