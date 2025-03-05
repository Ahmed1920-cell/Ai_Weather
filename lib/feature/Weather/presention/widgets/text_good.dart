import 'package:flutter/material.dart';

class TextGood extends StatelessWidget {
  const TextGood({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      "I advise you to stay at home because the weather the day is not good",
      style: TextStyle(fontSize: 15),
    );
  }
}
