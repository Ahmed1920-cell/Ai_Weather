import 'package:flutter/material.dart';

import '../../../../core/assets/componant.dart';

class Degree extends StatelessWidget {
  Degree({super.key, this.degree});

  var degree;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0, right: 20.0),
          child: Text(
            "$degree",
            style: TextStyle(fontSize: 50),
          ),
        ),
        Text(
          "O",
          style: TextStyle(fontSize: size),
        )
      ],
    );
  }
}
