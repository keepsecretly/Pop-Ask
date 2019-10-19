import "package:http/http.dart" as http;

class SurveyAPI {

  static Future<http.Response> list() async {
    var url = "https://api.surveymonkey.com/v3/surveys";

    return http.get(url);

    // Http.get(url).then((response) {
    //   print("Response status: ${response.body}");
    // });
  }
}
