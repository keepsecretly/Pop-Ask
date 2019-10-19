import "package:http/http.dart" as http;
import 'dart:convert';

import 'package:pop_ask/model/survey_model.dart';
import 'package:pop_ask/model/surveys_model.dart';

class SurveyAPI {
  static final String baseUrl = "https://api.surveymonkey.com/";

  static Future<Surveys> list() async {
    var response = await http.get(baseUrl + "/v3/surveys", headers: {
      "Authorization":
          "Bearer r0s9r6NRM1l6Hl6jTkDPwKOeMba-3josbWplJIMOEjBml-benUtMf0jRhc5MpYW1B97CNEEllcO1wqHpzLVh9zMqw-nfZPxx9kb0EoNmy.5p5Qg9RNOWKdwqt5eJYJm7"
    });

    if (response.statusCode == 200) {
      return Surveys.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load surveys');
    }
  }

  static Future<Survey> get(String id) async {
    var response =
        await http.get(baseUrl + "/v3/surveys/" + id + "/details", headers: {
      "Authorization":
          "Bearer r0s9r6NRM1l6Hl6jTkDPwKOeMba-3josbWplJIMOEjBml-benUtMf0jRhc5MpYW1B97CNEEllcO1wqHpzLVh9zMqw-nfZPxx9kb0EoNmy.5p5Qg9RNOWKdwqt5eJYJm7"
    });

    if (response.statusCode == 200) {
      return Survey.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load survey');
    }
  }
}
