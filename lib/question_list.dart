import 'package:flutter/material.dart';
import 'package:pop_ask/model/question_model.dart';

final TextEditingController eCtrl = new TextEditingController();

class ListDisplay extends StatefulWidget {
  final List<Question> quizes;
  ListDisplay({Key key, @required this.quizes}) : super(key: key);

  @override
  State createState() => new DyanmicList(quizes: quizes);

}

class DyanmicList extends State<ListDisplay> {
  List<String> litems = [];

  final List<Question> quizes;
  DyanmicList({Key key, @required this.quizes});

  Widget buildQuestionList (BuildContext ctxt) {
    return ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              for(var q in quizes ) buildAnswer(ctxt, q),
            ]
          );
  }

  Widget buildAnswer (BuildContext ctxt, Question q) {
      var qtype = "Long";
      if (qtype.matchAsPrefix("Long") == true) {
        return buildLongAnswer(ctxt);
      } else if (qtype.matchAsPrefix("Short") == true) {
        return buildShortAnswer(ctxt);
      } else {
        return new Text("");
      }
  }

  Widget buildShortAnswer (BuildContext ctxt) {

    final TextEditingController eCtrl = new TextEditingController();

    return new Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          children: <Widget>[
            Text("Question"),
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

  Widget buildLongAnswer (BuildContext ctxt) {

    final TextEditingController eCtrl = new TextEditingController();

    return new Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          children: <Widget>[
            Text("Question"),
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
    return new Scaffold(
      body: buildQuestionList(ctxt),
    );
  }
}
