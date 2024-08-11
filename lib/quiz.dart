import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';

import 'data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';


  // @override
  // void initState() {
  //  activeScreen = 'questions-screen';
  //   super.initState();
  // }

 void switchScreen(){
    setState(() {
      activeScreen ='questions-screen';
    });
  }

  void chooseAnswer(String answer){
   selectedAnswers.add(answer);
   if(selectedAnswers.length == questions.length){
     setState(() {
       activeScreen = 'start-screen';
     });
   }
  }

  @override
  Widget build(BuildContext context) {
Widget screenWidget = StartScreen(switchScreen);

if(activeScreen == 'questions-screen'){
  screenWidget =  QuestionsScreen(onSelectAnswer:chooseAnswer,);
}

    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.deepPurple.shade900,
                  Colors.deepPurple.shade200,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight
            ),
          ),
          child: screenWidget,
        ) ,
      ),
    );
  }
}
