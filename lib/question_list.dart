import 'package:flutter/material.dart';
import 'package:pop_ask/model/question_model.dart';

final TextEditingController eCtrl = new TextEditingController();

class ListDisplay extends StatefulWidget {
  final List<Question> quizes;
  ListDisplay({Key key, @required this.quizes}) : super(key: key);

  @override
  State createState() => new DyanmicList(quizes: quizes);

}

final String OPEN_ENDED = "open_ended";
final String SINGLE = "single";
final String ESSAY = "essay";

class DyanmicList extends State<ListDisplay> {
  List<String> litems = [];

  final List<Question> quizes;
  DyanmicList({Key key, @required this.quizes});

  Widget buildQuestionList (BuildContext ctxt) {
    return Column(
            children: <Widget>[
              for(var q in quizes ) buildAnswer(ctxt, q),
            ]
          );
  }

  Widget buildAnswer (BuildContext ctxt, Question q) {

      if (q.family == OPEN_ENDED) {
        if (q.subType == SINGLE) {
          return buildShortAnswer(ctxt, q);
        } else if (q.subType == ESSAY) {
          return buildLongAnswer(ctxt, q);
        }
      }

      return new Text("");
  }

  Widget buildShortAnswer (BuildContext ctxt, Question q) {

    final TextEditingController eCtrl = new TextEditingController();

    return new Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          children: <Widget>[
            Text(q.headings[0].heading),
            TextFormField(
              controller: eCtrl,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              onFieldSubmitted: (text) {
                litems.add(text);
                eCtrl.clear();
                setState(() {});
              },
            )
          ],
        )
    );
  }

  Widget buildLongAnswer (BuildContext ctxt, Question q) {

    final TextEditingController eCtrl = new TextEditingController();

    return new Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          children: <Widget>[
            Text(q.headings[0].heading),
            TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              controller: eCtrl,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              onFieldSubmitted: (text) {
                litems.add(text);
                eCtrl.clear();
                setState(() {});
              },
            )
          ],
        )
    );
  }

  @override
  Widget build (BuildContext ctxt) {
    return buildQuestionList(ctxt);
  }
}
