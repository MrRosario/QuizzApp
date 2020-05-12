import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<Question> _questionBank = [

    Question(
      'O corpo humano tem 206 ossos',
      true
    ),
    Question(
      'O sangue de uma lesma é verde.', 
      true
    ),
    Question(
      'O maior animal do mundo é Elefante',
      false
    ),
    Question(
      'RG na Russia se chama \"Passport\"', 
      true
    ),
    Question(
      'Você pode levar uma vaca escada abaixo, mas não escada acima.', 
      false
    ),
    Question(
      'A área total da superfície de dois pulmões humanos é de aproximadamente 70 metros quadrados.',
      true
    ),
    Question(
      'Um quarto dos ossos humanos estão nos pés.', 
      true
    ),
    Question(
      'É ilegal fazer xixi no oceano em Portugal.', 
      true
    ),
    Question(
      'Alguns gatos são alergicos a seres humanos.', 
      true
    ),
    Question(
      'Nenhum pedaço de papel quadrado quadrado pode ser dobrado ao meio mais de 7 vezes.',
      false
    ),
    Question(
      'Em Londres, Reino Unido, se você morrer na Câmara do Parlamento, tem tecnicamente o direito a um funeral de Estado, porque o edifício é considerado um local sagrado demais.',
      true
    ),
    Question(
      'Instagram foi originalmente chamado \"Burnbn\"', 
      true
    ),
    Question(
      'Na Virgínia Ocidental, EUA, se você acidentalmente bater em um animal com seu carro, poderá levá-lo para casa para comer.',
      true
    ),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      print('Now returning true');
      return true;
    } else {
      print('Now returning false');
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
