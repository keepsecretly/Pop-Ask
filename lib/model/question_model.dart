import 'package:pop_ask/model/display_option.dart';

import 'required_model.dart';

class Question {
  final DisplayOption displayOption;
  final Required required;
  final String subType;
  final String family;

  Question({this.displayOption, this.required, this.subType, this.family});

  factory Question.fromJson(Map<String, dynamic> json) {
    var displayOptionsJson = json['display_options'];
    var requiredJson = json['required'];

    var displayOptions;
    var required;

    if (displayOptionsJson != null) {
      displayOptions = DisplayOption.fromJson(json['display_options']);
    }

    if (requiredJson != null) {
      required = Required.fromJson(json['required']);
    }

    return Question(
      displayOption: displayOptions,
      required: required,
      subType: json['sub_type'],
      family: json['family'],
    );
  }
}
