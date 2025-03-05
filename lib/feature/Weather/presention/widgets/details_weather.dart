import 'package:ai_weather/feature/Weather/domain/entity/WeatherEntity.dart';
import 'package:flutter/material.dart';

import '../../../../core/assets/componant.dart';
import 'chart.dart';

class DetailsWeather extends StatelessWidget {
  DetailsWeather({super.key, required this.weather});

  Forecastday weather;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 90 / 776,
      width: MediaQuery.sizeOf(context).width,
      margin: EdgeInsets.only(left: 5),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: back_color, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Chart(
            color: Colors.yellow,
            icon: Icons.sunny,
            data: "UV Index",
            value: weather.hour[0].uv,
          ),
          Chart(
            color: Colors.grey,
            icon: Icons.air,
            data: "Wind Mph",
            value: weather.day.maxwindMph,
          ),
          Chart(
            color: Color(0xff030647),
            icon: Icons.water_drop,
            data: "Humidity",
            value: weather.hour[0].humidity,
            end: true,
          ),
        ],
      ),
    );
  }
}
