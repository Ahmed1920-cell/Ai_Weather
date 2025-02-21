import 'package:ai_weather/feature/Weather/domain/entity/WeatherEntity.dart';

class WeatherModel extends WeatherEntity{
  WeatherModel({required super.location, required super.current, required super.forecast});
  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
    location: Location.fromJson(json["location"]),
    current: Current.fromJson(json["current"]),
    forecast: Forecast.fromJson(json["forecast"]),
  );
}