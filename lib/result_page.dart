import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_with_animation/quiz_page.dart';
import 'package:quiz_with_animation/start_page.dart';

class ResultPage extends StatefulWidget {
  var score;
  var totalQuestion;
  var correct;
  var incorrect;
  var notAttempted;
  ResultPage(
      {this.score,
      this.totalQuestion,
      this.correct,
      this.incorrect,
      this.notAttempted});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String resultMessage;
  @override
  void initState() {
    super.initState();

    var percentage = (widget.score / (widget.totalQuestion * 20)) * 100;
    if (percentage >= 90) {
      resultMessage = 'Outstanding';
    } else if (percentage >= 80) {
      resultMessage = 'Good Work';
    } else if (percentage >= 70) {
      resultMessage = 'Good Effort';
    } else {
      resultMessage = 'Needs Improvement';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$resultMessage',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'You scored ${widget.score} out of ${widget.totalQuestion * 20}',
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '${widget.correct} Correct, ${widget.incorrect} Incorrect',
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => QuizPage(),
                  ),
                );
              },
              child: Text('Restart Again'),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => StartPage(),
                  ),
                );
              },
              child: Text('Home'),
            ),
          ],
        ),
      ),
    );
  }
}
