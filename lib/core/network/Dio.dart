import 'package:ai_weather/core/network/location.dart';
import 'package:dio/dio.dart';

class WeatherDio{
Dio dio;
location loc;
WeatherDio(this.dio,this.loc);
Future getweather()async{
  var response=await dio.get("https://api.weatherapi.com/v1/forecast.json",
  queryParameters: {
    "key":"b0b59101e40d4d87896232617251702",
    "q":await loc.getCurrentLocation(),
    "hour":24,
    "days":1,
    "dt":DateTime.now(),
  }
  );
  return response.data;
}
Future update(var date)async{
  var response=await dio.get("https://api.weatherapi.com/v1/forecast.json",
      queryParameters: {
        "key":"b0b59101e40d4d87896232617251702",
        "q":await loc.getCurrentLocation(),
        "dt":date,
        "hour":24,
        "days":1
      }
  );
  print(response.statusCode);
  print(response.data);
  return response.data;
}
}