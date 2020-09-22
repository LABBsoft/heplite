import 'package:flutter/material.dart';

class Mood {
  String emoji;
  String name;
  int value;

  Mood(String emoji, String name, int value) {
    this.emoji = emoji;
    this.name = name;
    this.value = value;
  }
}

List<Mood> oldMoods = [
  Mood('😟', 'dreadful', 1),
  Mood('😕', 'sad', 2),
  Mood('😐', 'meh', 3),
  Mood('🙂', 'happy', 4),
  Mood('😀', 'elated', 5)
];

class MoodInput extends StatefulWidget {
  MoodInput({Key key}) : super(key: key);

  @override
  _MoodInputState createState() => _MoodInputState();
}

class _MoodInputState extends State<MoodInput> {
  String _mood = '';

  void _setMood(String mood) {
    setState(() {
      _mood = mood;
    });
  }

  List<FlatButton> makeMoodButtons(List<Mood> moods) {
    return moods.map((mood) => FlatButton(
          child: Text(mood.emoji, style: TextStyle(fontSize: 30)),
          color: Colors.deepPurple[(mood.value * 100)],
          onPressed: () {
            _setMood(mood.emoji);
          },
        )).toList();
  }

  @override
  Widget build(BuildContext context) {
    return _mood == ''
        ? ButtonBar(
            alignment: MainAxisAlignment.spaceAround,
            children: makeMoodButtons(oldMoods))
        : Text(_mood, style: TextStyle(fontSize: 30));
  }
}
