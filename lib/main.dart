import 'package:flutter/material.dart';

import './question.dart';

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
    var questions = [
      'What\'s you favorite color?',
      'What\'s your favorite animal?',
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: [
            Question(questions.elementAt(_questionIndex)),
            RaisedButton(
              child: Text('Answer 1'),
              onPressed:
                  _answerQuestion, //we are passing a pointer to the fuction that we want to execute when a button is pressed, so i dont need the () because otherwise the fuction is called instatly and the result is passed to onpressed
            ),
            RaisedButton(
              child: Text('Answer 2'),
              onPressed: () => print('Answer 2 chosen'),
            ),
            RaisedButton(
              child: Text('Answer 3'),
              onPressed: () {
                //...
                print('Answer 3 chosen');
              },
            ),
          ],
        ),
      ),
    );
  }
}
