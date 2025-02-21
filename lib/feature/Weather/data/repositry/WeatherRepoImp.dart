
import '../../domain/repositry/WeatherRepo.dart';
import '../DataSource/WeatherDataRemote.dart';

class WeatherRepoImp extends WeatherRepo{
  BaseWeatherDataRemote baseWeatherDataRemote;
  WeatherRepoImp(this.baseWeatherDataRemote);
  @override
  Future get() async{
    return await baseWeatherDataRemote.get();
  }
  @override
  Future update(var date) async{
    return await baseWeatherDataRemote.update(date);
  }
}