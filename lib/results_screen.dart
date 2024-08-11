import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/questions_summary/questions_summary.dart';

import 'data/questions.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
   required this.chosenAnswers,
    required this.onRestart,
  });
final void Function() onRestart;
  final List<String> chosenAnswers;

  List <Map<String, Object>> getSummaryData(){
    final List <Map<String, Object>> summary =[];
  for(var i = 0; i<chosenAnswers.length; i++ ){
    summary.add({
      'question_index': i,
      'question':questions[i].text,
      'correct_answer': questions[i].answers[0],
      'user_answer': chosenAnswers[i],
    },
    );
  }
    return summary;

}


  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
     return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You answered ${numCorrectQuestions} out of ${numTotalQuestions} questions correctly.',style: GoogleFonts.lato(
              color:Colors.white,
              fontSize:20
            ),
            textAlign: TextAlign.center,),
            SizedBox( height:30),
            QuestionsSummary(summaryData),
            TextButton.icon(
              onPressed:onRestart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white
              ),
              icon: Icon(Icons.refresh),
              label: Text('Restart Quiz!'),
            ),
          ],
        ),
      ),
    );
  }
}
