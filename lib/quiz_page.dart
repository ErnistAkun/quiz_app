import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiz_app/custom_button.dart';
import 'package:quiz_app/quiz_brain.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> icons = <Widget>[];

  Widget correctIcon = const Padding(
    padding: EdgeInsets.only(
      right: 8.0,
    ),
    child: FaIcon(
      FontAwesomeIcons.check,
      color: Color(0xff4CAF4F),
    ),
  );
  Widget wrongIcon = const Padding(
    padding: EdgeInsets.only(
      right: 8.0,
    ),
    child: FaIcon(
      FontAwesomeIcons.times,
      color: Color(0xffF44336),
    ),
  );

  String suroo = 'Suroo';
  //suroo buttu, ayagyna chykty

  bool isFinished = false;

  @override
  void initState() {
    super.initState();

    suroo = quizBrain.getQuestion();
  }

  ///koldonuuchu joop berdi
  userAnswered(bool answer) {
    /// tuura joop
    bool realAnswer = quizBrain.getAnswer();

    if (answer == realAnswer) {
      icons.add(correctIcon);
    } else {
      icons.add(wrongIcon);
    }

    quizBrain.getNext();
    suroo = quizBrain.getQuestion();

    if (suroo == 'Аягы!') {
      isFinished = true;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff111328),
      appBar: AppBar(
        backgroundColor: Color(0xff111328),
        title: const Center(
          child: Text(
            'Quiz App',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(height: 35.0),
              Text(
                suroo ?? 'Suroo',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26.0,
                ),
                textAlign: TextAlign.center,
              ),
              if (isFinished)
                CustomButton(
                    buttonText: 'Кайрадан башта!',
                    bgColor: const Color(0xff4CAF4F),
                    onPressed: () {
                      quizBrain.reset();
                      suroo = quizBrain.getQuestion();
                      isFinished = false;
                      icons = <Widget>[];
                      setState(() {});
                    })
              else
                Column(
                  children: [
                    CustomButton(
                      onPressed: () {
                        userAnswered(true);
                      },
                      buttonText: 'Туура',
                      bgColor: const Color(0xff4CAF4F),
                    ),
                    const SizedBox(height: 20.0),
                    CustomButton(
                      onPressed: () {
                        userAnswered(false);
                      },
                      buttonText: 'Туура эмес',
                      bgColor: const Color(0xffF44336),
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
              Row(
                children: icons,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
