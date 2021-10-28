import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result(@required this.resultScore, @required this.resetHandler);

  String get resultPase {
    var resultText;
    if (resultScore <= 8) {
      resultText = "You are awesome and innocent";
    } else if (resultScore <= 12) {
      resultText = "Pretty descent!";
    } else if (resultScore <= 16) {
      resultText = "You are...........!!!  strange ";
    } else {
      resultText = "You are so bad...";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(
          resultPase,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        FloatingActionButton(                  
          onPressed: resetHandler,
          child: Icon(Icons.replay_outlined),
          backgroundColor: Colors.redAccent
        ),
      ],
    ),
    );
  }
}
