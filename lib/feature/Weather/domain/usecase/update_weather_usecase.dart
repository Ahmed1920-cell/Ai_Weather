import 'package:ai_weather/feature/auth/domain/repositry/AuthRepo.dart';

import '../repositry/WeatherRepo.dart';

class UpdateWeatherUsecase{
  WeatherRepo weatherRepo;
  UpdateWeatherUsecase(this.weatherRepo);
  Future excute(var date)async{
    return await weatherRepo.update(date);
  }
}