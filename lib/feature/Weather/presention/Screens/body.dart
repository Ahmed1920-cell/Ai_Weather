import 'package:ai_weather/core/assets/componant.dart';
import 'package:ai_weather/feature/Weather/presention/widgets/details_weather.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../domain/entity/WeatherEntity.dart';
import '../widgets/degree.dart';
import '../widgets/easy_date.dart';
import 'header.dart';

class body_screen extends StatelessWidget {
  body_screen({super.key, required this.weather, this.location});

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
            height: MediaQuery.sizeOf(context).height * 500 / 776,
            width: MediaQuery.sizeOf(context).width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(
                    child: Image.network(
                  "https:${weather.hour[0].condition.icon}",
                  height: MediaQuery.sizeOf(context).height * 250 / 776,
                  width: MediaQuery.sizeOf(context).width * 250 / 360,
                  fit: BoxFit.fill,
                )),
                Degree(
                  degree: weather.hour[0].tempC,
                ),
                Text(
                  "${weather.hour[0].condition.text}",
                  style: TextStyle(fontSize: 20),
                ),
                DetailsWeather(
                  weather: weather,
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 20 / 776,
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.sizeOf(context).height * 110 / 776,
            width: MediaQuery.sizeOf(context).width,
            margin: EdgeInsets.only(left: 5),
            padding: EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
                color: back_color, borderRadius: BorderRadius.circular(20)),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 14,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: EasyDate(
                          index: index,
                          date_weather: weather.date,
                        ),
                      ),
                    ],
                  );
                }),
          ),
          Container(
            height: MediaQuery.sizeOf(context).height * 40 / 776,
            width: MediaQuery.sizeOf(context).width,
            margin: EdgeInsets.only(left: 5, top: 10),
            padding: EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
                color: back_color, borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text(
                      "${DateFormat.MMMd().format(weather.date)}: ${weather.day.mintempC} / ${weather.day.maxtempC}",
                      style: TextStyle(fontSize: 18))),
            ),
          ),
        ],
      ),
    );
  }
}
