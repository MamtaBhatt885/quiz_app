import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
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

  @override
  Widget build(BuildContext context) {

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
          child: activeScreen == 'start-screen'?
          StartScreen(switchScreen)
              :QuestionsScreen(),
        ) ,
      ),
    );
  }
}
