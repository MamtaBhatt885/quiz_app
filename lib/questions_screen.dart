import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
 var currentQuestionIndex = 0;

 answerQuestion(){
   //currentQuestionIndex = currentQuestionIndex + 1;
   //currentQuestionIndex += 1;
   setState(() {
     currentQuestionIndex++ ;
   });


 }

  @override
  Widget build(BuildContext context) {
final  currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            Text(currentQuestion.text,
              style: TextStyle(color: Colors.white, fontSize: 20),
            textAlign: TextAlign.center,
            ),
            SizedBox(height: 30,),


            ...currentQuestion.getShuffledAnswers().map((answer) {
          return AnswerButton(answerText: answer, onTap: answerQuestion,);
        })

          ],
        ),
      ),
    );
  }
}
