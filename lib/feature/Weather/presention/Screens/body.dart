import 'package:ai_weather/core/assets/componant.dart';
import 'package:ai_weather/core/network/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../domain/entity/WeatherEntity.dart';
import '../Bloc/WeatherBloc.dart';
import '../widgets/chart.dart';
import '../widgets/degree.dart';
import '../widgets/easy_date.dart';
import 'header.dart';


class body_screen extends StatelessWidget {
   body_screen({super.key,required this.weather,this.location});
Forecastday weather;
final location;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Header(user: location),
          Container(
            height: MediaQuery.sizeOf(context).height*500/776,
            width: MediaQuery.sizeOf(context).width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(child: Image.network("https:${weather.hour[0].condition.icon}",height: MediaQuery.sizeOf(context).height*250/776,width: MediaQuery.sizeOf(context).width*250/360,fit: BoxFit.fill,)),
                Degree(degree:weather.hour[0].tempC ,),
                Text("${weather.hour[0].condition.text}",style: TextStyle(fontSize: 20),),
               // Text("${weather.day.mintempC} / ${weather.day.maxtempC}",style: TextStyle(fontSize: size)),
                Container(
                  height: MediaQuery.sizeOf(context).height*90/776,
                  width: MediaQuery.sizeOf(context).width,
                  margin: EdgeInsets.only(left: 5),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: back_color,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Chart(color: Colors.yellow,icon: Icons.sunny,data: "UV Index",value: weather.hour[0].uv,),
                      Chart(color: Colors.grey,icon: Icons.air,data: "Wind Mph",value: weather.day.maxwindMph,),
                      Chart(color: Color(0xff030647),icon: Icons.water_drop,data: "Humidity",value: weather.hour[0].humidity,end: true,),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height*20/776,)
              ],
            ),
          ),
          Container(
            height: 110,
            width: MediaQuery.sizeOf(context).width,
            margin: EdgeInsets.only(left: 5),
            padding: EdgeInsets.only(left: 15,right: 15),
            decoration: BoxDecoration(
                color: back_color,
                borderRadius: BorderRadius.circular(20)
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
          Container(
            height: MediaQuery.sizeOf(context).height*40/776,
            width: MediaQuery.sizeOf(context).width,
            margin: EdgeInsets.only(left: 5, top: 10),
            padding: EdgeInsets.only(left: 15,right: 15),
            decoration: BoxDecoration(
                color: back_color,
                borderRadius: BorderRadius.circular(20)
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text("${DateFormat.MMMd().format(weather.date)}: ${weather.day.mintempC} / ${weather.day.maxtempC}",style: TextStyle(fontSize: 18))),
            ),
          ),


        ],
      ),
    );
  }
}
