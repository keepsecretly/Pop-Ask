import 'package:pop_ask/model/display_option.dart';
import 'package:pop_ask/model/heading_model.dart';

import 'required_model.dart';

class Question {
  final DisplayOption displayOption;
  final Required required;
  final String subType;
  final String family;
  final List<Heading> headings;

  Question(
      {this.displayOption,
      this.required,
      this.subType,
      this.family,
      this.headings});

  factory Question.fromJson(Map<String, dynamic> json) {
    var displayOptionsJson = json['display_options'];
    var requiredJson = json['required'];
    var headingsJson = json['headings'] as List;

    var displayOptions;
    var required;
    var headings;

    if (displayOptionsJson != null) {
      displayOptions = DisplayOption.fromJson(json['display_options']);
    }

    if (requiredJson != null) {
      required = Required.fromJson(json['required']);
    }

    if (headingsJson != null) {
      headings = headingsJson.map((p) => Heading.fromJson(p)).toList();
    }

    return Question(
      displayOption: displayOptions,
      required: required,
      subType: json['subtype'],
      family: json['family'],
      headings: headings,
    );
  }
}
