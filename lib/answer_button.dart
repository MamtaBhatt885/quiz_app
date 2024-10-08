import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {

  final String answerText;
  final void Function() onTap;
  const AnswerButton({super.key,required this.answerText,required this.onTap });

  @override
  Widget build(BuildContext context) {
    return   ElevatedButton(onPressed: onTap,
    style:ElevatedButton.styleFrom(
      padding:EdgeInsets.symmetric(vertical: 10,
          horizontal: 40) ,
      backgroundColor: Colors.purple.shade900,
          foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40)
      )
    ) ,
      child: Text(answerText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
