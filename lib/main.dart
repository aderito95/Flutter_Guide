import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

// void main() {
//   runApp(MyApp());
// }
//prova

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  //it is re-built every time that setState it's called
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  // "_" means it's a private class, hence MyAppState can be referenced and used only in this file
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      //without setState(), the Widget does change its property value, but it will not re-run the build() method- hence updates aren't reflected on the screen. It call re-build only for the widget where u call setState()
      _questionIndex += 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    const questions = [
      {
        'QuestionText': 'What\'s you favorite color?',
        'answers': ['Black', 'Red', 'Green', 'White'],
      },
      {
        'QuestionText': 'What\'s you favorite animal?',
        'answers': ['Rabbit', 'Snake', 'Elephant', 'Lion'],
      },
      {
        'QuestionText': 'What\'s you favorite instructor?',
        'answers': ['Chiara', 'Andrea', 'Giuseppe', 'Teresa'],
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: [
            Question(
              questions[_questionIndex]['QuestionText'],
            ),
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
              //'...' is the spread operator: adds each element of the list to the surrounding list as individual values
              //for every answer at questions[i] we want to return a new widget
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
