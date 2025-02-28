import 'package:ai_weather/feature/Weather/domain/entity/WeatherEntity.dart';
import 'package:ai_weather/feature/Weather/domain/repositry/WeatherRepo.dart';
import 'package:ai_weather/feature/auth/domain/repositry/AuthRepo.dart';

class GetWeatherUsecase{
  WeatherRepo weatherRepo;
  GetWeatherUsecase(this.weatherRepo);
  Future<WeatherEntity> excute()async{
    return await weatherRepo.get();
  }
}