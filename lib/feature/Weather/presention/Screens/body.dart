import 'package:ai_weather/core/assets/componant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Bloc/WeatherBloc.dart';
import '../widgets/chart.dart';
import '../widgets/degree.dart';
import '../widgets/easy_date.dart';
import 'header.dart';


class body_screen extends StatelessWidget {
   body_screen({super.key,this.weather});
final weather;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Header(user: ""),
          Text("Calender",style: TextStyle(fontSize: size),),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(left: 5,top: 10,bottom: 10),
              padding: EdgeInsets.only(left: 5,right: 15),
              decoration: BoxDecoration(
                  color: orange,
                  borderRadius: BorderRadius.circular(50)
              ),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 14,
                  itemBuilder: (context,index){
                    return Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: EasyDate(index: index,date_weather: weather.date,),
                        ),
                      ],
                    );
                  }),
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(child: Row(
                  children: [
                    Image.network("https:${weather.day.condition.icon}",height: 150,width: 150,fit: BoxFit.fill,),
                    Text("${weather.day.condition.text}",style: TextStyle(fontSize: 20),),
                  ],
                )),
                Text("${BlocProvider.of<WeatherCubit>(context).Country}",style: TextStyle(fontSize: size),),
                Degree(degree:weather.day.avgtempC ,),
                Text("${weather.day.mintempC} / ${weather.day.maxtempC}",style: TextStyle(fontSize: size)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Chart(data: "Wind Kph",value: weather.day.maxwindKph,),
                    Chart(data: "Wind Mph",value: weather.day.maxwindMph,),
                  ],
                ),
                SizedBox(height: 20,)
              ],
            ),
          ),


        ],
      ),
    );
  }
}
