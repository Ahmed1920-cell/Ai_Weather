import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../core/assets/componant.dart';

class Chart extends StatelessWidget {
   Chart({super.key,this.data,this.value});
var data;
var value;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("$data",style: TextStyle(fontSize: 20),),
        new CircularPercentIndicator(
          progressColor:orange,
          radius: 30.0,
          lineWidth: 5.0,
          percent: (value/100),
          center: new Text("$value"),
        )

      ],
    );
  }
}
