class WeatherState{}
class InstialState extends WeatherState{}
class LoadingState extends WeatherState{}
class DoneState extends WeatherState{}
class UpdateState extends WeatherState{}
class ErrorState extends WeatherState{
  String error;

  ErrorState(
  {
    required this.error
}
      );
}