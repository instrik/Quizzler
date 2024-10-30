// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quizzler/Question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';
// trail comment 4
QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: quizzler(),
    );
  }
}

class quizzler extends StatefulWidget {
  @override
  State<quizzler> createState() => _quizzlerState();
}

class _quizzlerState extends State<quizzler> {
  QuizBrain quizBrain = QuizBrain();

  checkAlert() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: quizBrain.scores,
            ),
            Divider(color: Colors.white),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(50),
                          child: Text(
                            quizBrain.getQuestionText(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    child: Card(
                      color: Colors.green,
                      child: ListTile(
                        title: Center(
                          child: Text(
                            'True',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      quizBrain.updateIcon(true);
                      setState(() {
                        quizBrain.nextQuestion(context);
                      });
                    },
                  ),
                  InkWell(
                    child: Card(
                      color: Colors.red,
                      child: ListTile(
                        title: Center(
                          child: Text(
                            'False',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      quizBrain.updateIcon(false);
                      setState(() {
                        quizBrain.nextQuestion(context);
                      });
                    },
                  ),
                  Divider(color: Colors.white),
                  SizedBox(
                    height: 20,
                    width: 250,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
