import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../core/assets/componant.dart';

class Chart extends StatelessWidget {
  Chart(
      {super.key,
      this.data,
      this.value,
      this.end = false,
      this.icon,
      this.color});

  var data;
  var value;
  var icon;
  var color;
  bool end;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
          border: !end
              ? Border(right: BorderSide(color: Colors.black, width: 1))
              : null),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: color,
              ),
              Text(
                " $data",
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            "$value",
            style: TextStyle(fontSize: 14),
          )
        ],
      ),
    );
  }
}
