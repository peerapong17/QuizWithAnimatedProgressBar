import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_with_animation/quiz_page.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  side: BorderSide(color: Colors.green),
                ),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => QuizPage(),
              ),
            );
          },
          child: Padding(padding: EdgeInsets.all(10),child: Text('Click To Start', style: TextStyle(fontSize: 30),)),
        ),
      ),
    );
  }
}
