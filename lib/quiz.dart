import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz(
      {@required this.questions,
      @required this.answerQuestion,
      @required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['QuestionText'],
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          //'...' is the spread operator: adds each element of the list to the surrounding list as individual values
          //for every answer at questions[i] we want to return a new widget
          return Answer(
              () => answerQuestion(answer['score']),
              answer[
                  'text']); // we use the anonymous function because the onpressed needs a callback function with no arguments (a pointer)
        }).toList()
      ],
    );
  }
}
