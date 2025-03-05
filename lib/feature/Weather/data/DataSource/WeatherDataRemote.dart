import 'package:ai_weather/core/firebase/firebase_service.dart';
import 'package:ai_weather/core/network/Dio.dart';
import 'package:ai_weather/feature/Weather/data/DTO/WeatherModel.dart';

abstract class BaseWeatherDataRemote{
  Future get();
  Future update(var date);
  Future<List> predict(List<int> features);
}
class WeatherDataRemote extends BaseWeatherDataRemote{
  WeatherDio weatherDio;
  WeatherDataRemote(this.weatherDio);
  @override

  @override
  Future get() async{
    var response=await weatherDio.getweather();
    WeatherModel weather=WeatherModel.fromJson(response);
    return weather;
  }

  @override
  Future update(var date) async{
    var response=await weatherDio.update(date);
    WeatherModel weather=WeatherModel.fromJson(response);
    return weather;
  }

  @override
  Future<List> predict(List<int> features) async{
    var response=await weatherDio.getPrediction(features);
    return response;

  }
}