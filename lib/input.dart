import 'package:flutter/material.dart';

class Answer<T> {
  String label;
  Color color;
  T value;

  Answer(String label, Color color, T value) {
    this.label = label;
    this.color = color;
    this.value = value;
  }
}

class QuestionCard<T> extends StatefulWidget {
  QuestionCard({Key key, @required this.question, @required this.answers})
      : super(key: key);
  final String question;
  final List<Answer<T>> answers;

  @override
  _QuestionCardState<T> createState() => _QuestionCardState(question, answers);
}

class _QuestionCardState<T> extends State<QuestionCard> {
  _QuestionCardState(String question, List<Answer<T>> answers) {
    this.question = question;
    this.answers = answers;
  }
  String question = '';
  List<Answer<T>> answers;
  Answer<T> chosenAnswer;

  void _setAnswer(Answer<T> answer) {
    setState(() {
      chosenAnswer = answer;
    });
  }

  List<FlatButton> makeButtons(List<Answer<T>> answers) {
    return answers
        .map((answer) => FlatButton(
              child: Text(answer.label,
                  style: TextStyle(
                    fontSize: 30,
                  )),
              color: answer.color,
              onPressed: () {
                _setAnswer(answer);
              },
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(question, style: Theme.of(context).textTheme.headline5),
        if (chosenAnswer == null)
          ButtonBar(
              alignment: MainAxisAlignment.start,
              children: makeButtons(answers))
        else
          Text(chosenAnswer.label, style: TextStyle(fontSize: 30)),
      ],
    );
  }
}
