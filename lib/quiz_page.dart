import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quiz_with_animation/result_page.dart';

import 'data.dart';
import 'models.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage>
    with SingleTickerProviderStateMixin {
  List<QuestionModel> questions = <QuestionModel>[];
  int index = 0;
  int points = 0;
  int correct = 0;
  int incorrect = 0;
  int notAttempted = 0;

  AnimationController controller;

  Animation animation;

  double beginAnim = 0.0;

  double endAnim = 1.0;

  @override
  void initState() {
    super.initState();

    questions = getQuestions();

    controller =
        AnimationController(duration: const Duration(seconds: 10), vsync: this);
    animation = Tween(begin: beginAnim, end: endAnim).animate(controller)
      ..addListener(
        () {
          setState(
            () {
              // Change here any Animation object value.
            },
          );
        },
      );

    startProgress();

    animation.addStatusListener(
      (AnimationStatus animationStatus) {
        if (animationStatus == AnimationStatus.completed) {
          if (index < questions.length - 1) {
            index++;
            notAttempted++;
            resetProgress();
            startProgress();
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ResultPage(
                  score: points,
                  totalQuestion: questions.length,
                  correct: correct,
                  incorrect: incorrect,
                  notAttempted: notAttempted,
                ),
              ),
            );
          }
        }
      },
    );
  }

  startProgress() {
    controller.forward();
  }

  stopProgress() {
    controller.stop();
  }

  resetProgress() {
    controller.reset();
  }

  void nextQuestion() {
    if (index < questions.length - 1) {
      index++;
      resetProgress();
      startProgress();
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(
            score: points,
            totalQuestion: questions.length,
            correct: correct,
            incorrect: incorrect,
            notAttempted: notAttempted,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            size: 30,
          ),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                Text(
                  '${index + 1} / ',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  ' ${questions.length}',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  ' Question',
                  style: TextStyle(fontSize: 25),
                ),
                Spacer(),
                Text(
                  '$points ',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Points',
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              questions[index].question + "?",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: LinearProgressIndicator(
              value: animation.value,
            ),
          ),
          CachedNetworkImage(
            imageUrl: questions[index].imageUrl,
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                ),
                onPressed: () {
                  if (questions[index].answer == "True") {
                    setState(() {
                      points = points + 20;
                      nextQuestion();
                      correct++;
                    });
                  } else {
                    setState(
                      () {
                        points = points - 5;
                        nextQuestion();
                        incorrect++;
                      },
                    );
                  }
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Text(
                    'True',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                onPressed: () {
                  if (questions[index].answer == "False") {
                    setState(() {
                      points = points + 20;
                      nextQuestion();
                      correct++;
                    });
                  } else {
                    setState(
                      () {
                        points = points - 5;
                        nextQuestion();
                        incorrect++;
                      },
                    );
                  }
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Text(
                    'False',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
