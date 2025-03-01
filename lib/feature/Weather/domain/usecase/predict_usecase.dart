import 'package:ai_weather/feature/Weather/domain/entity/WeatherEntity.dart';
import 'package:ai_weather/feature/auth/domain/repositry/AuthRepo.dart';

import '../repositry/WeatherRepo.dart';

class PredictUsecase{
  WeatherRepo weatherRepo;
  PredictUsecase(this.weatherRepo);
  Future excute(WeatherEntity weather)async{
    var features=weather.getfeatures(weather.forecast.forecastday[0].hour[0]);
    return await weatherRepo.predict(features);
  }
}