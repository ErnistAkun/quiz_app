import 'dart:developer';

import 'package:quiz_app/quiz_model.dart';

class QuizBrain {
  int _index = 0;
  List<QuizModel> questionsAndAnswers = <QuizModel>[
    QuizModel(question: 'Кыргызстанда 70тен ашуун улут жашайт.', answer: true),
    QuizModel(question: 'Кыргызстандын борбор шаары Ош.', answer: false),
    QuizModel(question: 'Дүйнөдө Россия эң чоң мамлекет.', answer: true),
  ];

  String getQuestion() {
    if (_index < questionsAndAnswers.length) {
      log('getQuestion._index: $_index');
      log('question: ${questionsAndAnswers[_index].question}');
      return questionsAndAnswers[_index].question;
    } else {
      return 'Аягы!';
    }
  }

  void getNext() {
    _index++;
    log('_index: $_index');
  }

  bool getAnswer() {
    if (_index < questionsAndAnswers.length) {
      return questionsAndAnswers[_index].answer;
    }
  }

  void reset() {
    _index = 0;
  }
}

final QuizBrain quizBrain = QuizBrain();
