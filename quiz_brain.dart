// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'question.dart';
import 'main.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';

class QuizBrain {
  List<Question> questionBank = [
    Question(q: '1 + 1 = 2', a: true),
    Question(q: '4 - 4 = 0', a: true),
    Question(q: '9 - 3 = 5', a: false),
    Question(q: '9 - 5 = 4', a: true),
    Question(q: '7 - 3 = 6', a: false),
    Question(q: '1 + 1 = 2', a: true),
    Question(q: '4 - 4 = 0', a: true),
    Question(q: '9 - 3 = 5', a: false),
    Question(q: '9 - 5 = 4', a: true),
    Question(q: '7 - 3 = 6', a: false),
  ];

  void nextQuestion() {
    if (quizzler.questionNumber == questionBank.length) {
      Alert(
        context: context,
        type: AlertType.warning,
        title: "QUIZ OVER",
        desc: "please restart the app to play again",
        buttons: [
          DialogButton(
            child: Text(
              "Back",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            color: Color.fromRGBO(0, 179, 134, 1.0),
          ),
          DialogButton(
            child: Text(
              "Exit",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            gradient: LinearGradient(colors: [
              Color.fromRGBO(116, 116, 191, 1.0),
              Color.fromRGBO(52, 138, 199, 1.0)
            ]),
          )
        ],
      ).show();
    } else
      questionNumber++;
  }

  void checkAnswer() {
    bool correctAnswer =
        quizBrain.questionBank[questionNumber].questionAnswer; //to be checked
    if (correctAnswer == true) {
      scoreKeeper.add(
        Icon(
          Icons.check,
          color: Colors.green,
        ),
      );
    } else {
      scoreKeeper.add(
        Icon(
          Icons.close,
          color: Colors.red,
        ),
      );
    }
  }
}
