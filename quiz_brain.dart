// ignore_for_file: prefer_const_constructors, prefer_final_fields, sort_child_properties_last

import 'package:flutter/material.dart';
import 'Question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizBrain {
  int _i = 0, score = 0;

  List<Question> _questionBank = [
    Question(a: 'Abhijeet is buffalo.', b: true),
    Question(a: 'Jaymin is giraffe.', b: false),
    Question(a: 'Aakash is giraffe.', b: true),
    Question(a: 'Het is horse.', b: true),
    Question(a: 'Prateek is teddy bear.', b: true),
  ];

  List<Widget> scores = [
    Icon(
      Icons.remove,
      color: Colors.yellowAccent,
    ),
    Icon(
      Icons.remove,
      color: Colors.yellowAccent,
    ),
    Icon(
      Icons.remove,
      color: Colors.yellowAccent,
    ),
    Icon(
      Icons.remove,
      color: Colors.yellowAccent,
    ),
    Icon(
      Icons.remove,
      color: Colors.yellowAccent,
    ),
  ];

  updateIcon(bool userAnswer) {
    if (getCorrectAnswer(userAnswer)) {
      scores[_i] = Icon(Icons.check, color: Colors.green);
      score++;
    } else {
      scores[_i] = Icon(Icons.cancel, color: Colors.red);
    }
  }

  void nextQuestion(BuildContext context) {
    if (_i < _questionBank.length - 1) {
      _i++;
    } else {
      // alert program
      Alert(
        context: context,
        type: AlertType.warning,
        title: "Game Over",
        desc: "scored ${100 * score / scores.length}% marks",
        buttons: [
          DialogButton(
            child: Text(
              "Restart",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            onPressed: () {
              _i = 0;
              score = 0;
              Navigator.pop(context);
            },
            color: Colors.green,
          ),
          DialogButton(
            child: Text(
              "Exit",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            color: Colors.red,
          ),
        ],
      ).show();
    }
  }

  String getQuestionText() {
    return _questionBank[_i].questionText!;
  }

  bool getCorrectAnswer(bool userAnswer) {
    return userAnswer == _questionBank[_i].answer!;
  }
}
