import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        child: Text(answerText),
        onPressed:
            selectHandler, //we are passing a pointer to the fuction that we want to execute when a button is pressed, so i dont need the () because otherwise the fuction is called instatly and the result is passed to onpressed
      ),
    );
  }
}
