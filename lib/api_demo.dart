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

  final _formKey = GlobalKey<FormState>();

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
    List<Question> qs = [
      Question(),
      Question(),
      Question(),
      Question(),
    ];

      if (survey.pages.length > 0) {
        return Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                new ListDisplay(quizes: qs,),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: RaisedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false
                      // otherwise.
                      if (_formKey.currentState.validate()) {
                        Scaffold.of(context)
                            .showSnackBar(SnackBar(content: Text('Processing Data')));
                      }
                    },
                    child: Text('Submit'),
                  ),
                ),
              ],
            )
        );
      } else {
        return Text("This page has no question");
      }
  }
}
