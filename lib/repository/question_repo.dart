import '../models/question.dart';

class QuestionRepozitory {
  int _questionIndex = 0;

  final List<QuestionModel> _questionBasket = [
    QuestionModel(
        questionText:
            '1. Компьютердин негизги түзүлүштөрү: Системалык болок, мышь, клавиатура',
        questionAnswer: false),
    QuestionModel(
        questionText: '2. Монитор - маалыматты чыгаруучу түзүлүш',
        questionAnswer: true),
    QuestionModel(
        questionText: '3. Дисководдо - маалыматтар сакталат ',
        questionAnswer: false),
    QuestionModel(
        questionText: '4. Сырткы эс - маалыматты убактылуу сактайт',
        questionAnswer: false),
    QuestionModel(
        questionText: '5. Клавиатура - маалыматты киргизуучу түзүлүш',
        questionAnswer: true),
    QuestionModel(questionText: '', questionAnswer: true),
  ];

  String getQuestionText() {
    return _questionBasket[_questionIndex].questionText;
  }

  bool getQuestionAnswer() {
    return _questionBasket[_questionIndex].questionAnswer;
  }

  void nextQuestion() {
    if (_questionIndex + 1 < _questionBasket.length) {
      _questionIndex++;
    }
  }

  bool testOver() {
    if (_questionIndex + 1 >= _questionBasket.length) {
      return true;
    } else {
      return false;
    }
  }

  void testReset() {
    _questionIndex = 0;
  }
}
