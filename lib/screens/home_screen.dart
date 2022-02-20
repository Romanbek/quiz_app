import 'package:flutter/material.dart';
import 'package:quiz_app/constants/constants.dart';
import 'package:quiz_app/constants/app_text_styles.dart';
import 'package:quiz_app/repository/question_repo.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> choices = [];

  QuestionRepozitory test_1 = QuestionRepozitory();
  void buttonFunction(bool selectedButton) {
    if (test_1.testOver() == true) {
      // alert dialog
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('ТЕСТ БҮТТҮ!'),
            // content: Text('data'),
            actions: [
              FlatButton(
                child: Text('КАЙРА БАШТА'),
                onPressed: () {
                  Navigator.of(context).pop();

                  setState(() {
                    test_1.testReset();
                    choices = [];
                  });
                },
              ),
            ],
          );
        },
      );
    } else {
      setState(() {
        test_1.getQuestionAnswer() == selectedButton
            ? choices.add(kCorrectIcon)
            : choices.add(kMistakeIcon);

        test_1.nextQuestion();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                test_1.getQuestionText(),
                textAlign: TextAlign.center,
                style: AppTextStyles.mainQuestionStyle,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(children: <Widget>[
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: RaisedButton(
                          padding: const EdgeInsets.all(12),
                          textColor: Colors.white,
                          color: Colors.red[400],
                          child: const Icon(
                            Icons.close_sharp,
                            size: 30.0,
                          ),
                          onPressed: () {
                            buttonFunction(false);
                          },
                        ))),
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: RaisedButton(
                          padding: const EdgeInsets.all(12),
                          textColor: Colors.white,
                          color: Colors.green[400],
                          child: const Icon(Icons.check_sharp, size: 30.0),
                          onPressed: () {
                            buttonFunction(true);
                          },
                        ))),
              ])),
        ),
        Wrap(
          children: choices,
        ),
      ],
    );
  }
}
