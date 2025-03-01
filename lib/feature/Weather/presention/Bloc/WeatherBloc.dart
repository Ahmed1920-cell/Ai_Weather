import 'package:ai_weather/feature/Weather/domain/entity/WeatherEntity.dart';
import 'package:ai_weather/feature/Weather/domain/usecase/get_weather_usecase.dart';
import 'package:ai_weather/feature/Weather/domain/usecase/predict_usecase.dart';
import 'package:ai_weather/feature/Weather/domain/usecase/update_weather_usecase.dart';
import 'package:bloc/bloc.dart';

import '../../../../core/network/location.dart';
import 'WeatherState.dart';


class WeatherCubit extends Cubit<WeatherState>{
  GetWeatherUsecase getWeatherUsecase;
  UpdateWeatherUsecase updateWeatherUsecase;
  PredictUsecase predictUsecase;
  WeatherEntity? weather;
  int? predict;
  String? Country;
  WeatherCubit(this.getWeatherUsecase,this.updateWeatherUsecase,this.predictUsecase):super(InstialState());

  getweather()async{
    try{
  emit(LoadingState());
  weather=await getWeatherUsecase.excute();
  emit(DoneState());}
        catch(e){
      emit(ErrorState(error: e.toString()));
        }

}
  Future Update(var date)async{
    try{
    emit(LoadingState());
    weather=await updateWeatherUsecase.excute(date);
    emit(DoneState());}
    catch(e){
      emit(ErrorState(error: e.toString()));
    }
  }
  Future prediction()async{
    try{
    emit(LoadingDialog());
    List predict_list=await predictUsecase.excute(weather!);
    predict=predict_list[0];
    print(predict);
    emit(DoneState());}
        catch(e){
          emit(ErrorDialog());
        }
  }
}