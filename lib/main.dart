import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[900],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  int rightAnsw = 0;
  int wrongAnsw = 0;
  
  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();
    

    setState(() {

      if (quizBrain.isFinished()) {
      
        dynamic alertStyle = AlertStyle(
            animationType: AnimationType.grow,
            isCloseButton: false,
            isOverlayTapDismiss: true,
            animationDuration: Duration(milliseconds: 500),
            alertBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2.0),
              side: BorderSide(
                color: Colors.grey,
              ),
            ),
            titleStyle: TextStyle(
              color: Colors.black87,
              fontSize: 24
            ),
          );

        Alert(
          context: context,
          style: alertStyle,
          title: 'Terminou!',
          content: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row( children: <Widget>[
                  Icon(
                    Icons.check,
                    color: Colors.green,
                  ),
                  SizedBox(width: 10),
                  Text("Acertou $rightAnsw")
                ]),
                SizedBox(height: 5),
                Row( children: <Widget>[
                  Icon(
                    Icons.close,
                    color: Colors.red,
                  ),
                  SizedBox(width: 10),
                  Text("Errou $wrongAnsw")
                ])   
              ]
            ),
          ),
          buttons: [
            DialogButton(
              child: Text(
                "OK",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 100,
            )
          ]
        ).show();

        quizBrain.reset();

        scoreKeeper = [];
        rightAnsw = 0;
        wrongAnsw = 0;

      }
      else {
        if(userPickedAnswer == correctAnswer){          

          rightAnsw++;

          scoreKeeper.add(
            Icon(
              Icons.check,
              color: Colors.green,
              size: 24,
            )
          );
        } else {
          wrongAnsw++;

          scoreKeeper.add(
            Icon(
              Icons.close,
              color: Colors.red,
              size: 24,
            )
          );
        }
        quizBrain.nextQuestion();
      }
    });
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
            padding: EdgeInsets.all(15.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'Sim',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'Não',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswer(false);
              },
            ),
          ),
        ),
        SizedBox(height:20.0),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical:20.0, horizontal: 15.0),
            child: Row(
              children: scoreKeeper,
            ),
          )
        )
      ],
    );
  }
}
