import 'package:flutter/material.dart';
import 'package:pop_ask/api/survey_api.dart';
import 'package:pop_ask/model/surveys_model.dart';

class ApiDemo extends StatefulWidget {
  ApiDemo({Key key}) : super(key: key);

  @override
  _ApiDemoState createState() => _ApiDemoState();
}

class _ApiDemoState extends State<ApiDemo> {
  Future<Surveys> surveys;

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
                return Text(snapshot.data.surveys[0].title);
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
}
