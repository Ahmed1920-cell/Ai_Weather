
import 'package:ai_weather/core/assets/componant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

import '../Bloc/WeatherBloc.dart';

class EasyDate extends StatelessWidget {
   EasyDate({super.key,this.index,this.date_weather});
   var index;
   var date_weather;

  @override
  Widget build(BuildContext context) {
    var date=DateFormat('yyyy-MM-dd').format(Jiffy.parse(DateTime.now().toString()).add(days: index).dateTime);
    return Container(
      padding: EdgeInsets.all(8),
      alignment: Alignment.center,
      height: MediaQuery.sizeOf(context).height * 60 / 776,
      width: MediaQuery.sizeOf(context).width * 50/360,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: DateFormat('yyyy-MM-dd').format(date_weather)==date?Colors.white:back_color,
      ),
      child: InkWell(
        onTap: (){
          BlocProvider.of<WeatherCubit>(context).Update(DateTime.parse(date));
        },
        child: Column(
          children: [
            Text("${DateFormat.E().format(DateTime.parse(date))}",style: TextStyle(color: Colors.black),),
            Text("${DateFormat.d().format(DateTime.parse(date))}",style: TextStyle(color: Colors.black),),
          ],
        ),
      ),
    );
  }
}
