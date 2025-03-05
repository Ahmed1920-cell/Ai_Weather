abstract class WeatherRepo{
  Future get();

  Future update(var date);

  Future<List> predict(List<int> features);
}