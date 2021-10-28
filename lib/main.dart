import 'package:flutter/material.dart';
import 'package:quizapp/quiz.dart';
import 'package:quizapp/result.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  static const _questions = [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'text': 'Purple', 'score': 5},
        {'text': 'Blue', 'score': 4},
        {'text': 'Lavender', 'score': 2},
        {'text': 'Black', 'score': 10},
        {'text': 'White', 'score': 1}
      ]
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'Dog', 'score': 1},
        {'text': 'Lion', 'score': 20},
        {'text': 'Tiger', 'score': 15},
        {'text': 'Deer', 'score': 12}
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < _questions.length) {
      print('We have more questions');
    } else {
      print("No more questions");
    }

    // print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("My First App"),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(_totalScore,_resetQuiz),
              ),
    );
  }
}
