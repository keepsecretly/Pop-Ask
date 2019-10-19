import 'package:flutter/material.dart';
import 'package:pop_ask/api/survey_api.dart';
import 'package:pop_ask/model/page_model.dart';
import 'package:pop_ask/model/question_model.dart';
import 'package:pop_ask/model/survey_model.dart';
import 'package:pop_ask/question_list.dart';

class ApiDemo extends StatefulWidget {
  ApiDemo({Key key}) : super(key: key);

  @override
  _ApiDemoState createState() => _ApiDemoState();
}

class _ApiDemoState extends State<ApiDemo> {
  Future<Survey> survey;
  
  @override
  void initState() {
    super.initState();
    survey = SurveyAPI.get("271477286");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Survey>(
            future: survey,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
//                return Text(snapshot.data.surveys[0].title);
                return firstPage(context, snapshot.data);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

  Widget firstPage(BuildContext context, Survey survey) {
      if (survey.pages.length > 0) {
        return new ListDisplay(quizes: survey.pages[0].questions,);
      } else {
        return Text("This page has no question");
      }
  }
}
