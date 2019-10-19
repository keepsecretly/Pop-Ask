import 'package:flutter/material.dart';
import 'package:pop_ask/api/survey_api.dart';
import 'package:pop_ask/model/page_model.dart';
import 'package:pop_ask/model/question_model.dart';
import 'package:pop_ask/model/surveys_model.dart';
import 'package:pop_ask/question_list.dart';

class ApiDemo extends StatefulWidget {
  ApiDemo({Key key}) : super(key: key);

  @override
  _ApiDemoState createState() => _ApiDemoState();
}

class _ApiDemoState extends State<ApiDemo> {
  Future<Surveys> surveys;

  List<Page> pages = [];

  @override
  void initState() {
    super.initState();
    surveys = SurveyAPI.list();
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
          child: FutureBuilder<Surveys>(
            future: surveys,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
//                return Text(snapshot.data.surveys[0].title);
                return firstPage(context);
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

  Widget firstPage(BuildContext context) {
      if (pages.length > 0) {
        return new ListDisplay(quizes: pages[0].questions,);
      } else {
        return Text("This page has no question");
      }
  }
}
