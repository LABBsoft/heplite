import 'package:flutter/material.dart';
import './input.dart';

List<Answer> moodAnswers = [
  Answer('😟', Colors.blue[100], '😟'),
  Answer('😕', Colors.blue[200], '😕'),
  Answer('😐', Colors.blue[300], '😐'),
  Answer('🙂', Colors.blue[400], '🙂'),
  Answer('😀', Colors.blue[500], '😀')
];

List<Answer> booleanAnswers = [
  Answer('No', Colors.red, false),
  Answer('Yes', Colors.blue, true),
];
