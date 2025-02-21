import 'package:ai_weather/feature/Weather/domain/entity/WeatherEntity.dart';
import 'package:ai_weather/feature/Weather/domain/usecase/get_weather_usecase.dart';
import 'package:ai_weather/feature/Weather/domain/usecase/update_weather_usecase.dart';
import 'package:bloc/bloc.dart';

import '../../../../core/network/location.dart';
import 'WeatherState.dart';


class WeatherCubit extends Cubit<WeatherState>{
  GetWeatherUsecase getWeatherUsecase;
  UpdateWeatherUsecase updateWeatherUsecase;
  WeatherEntity? weather;
  String? Country;
  location loc;
  WeatherCubit(this.getWeatherUsecase,this.updateWeatherUsecase,this.loc):super(InstialState());

  getweather()async{
  emit(LoadingState());
  weather=await getWeatherUsecase.excute();
  Country=await loc.getCurrentLocation();
  emit(DoneState());

}
  Future Update(var date)async{
    emit(LoadingState());
    weather=await updateWeatherUsecase.excute(date);
    emit(DoneState());
  }
}