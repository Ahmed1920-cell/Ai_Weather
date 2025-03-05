import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:ai_weather/core/network/location.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class WeatherDio{
Dio dio;
location loc;
WeatherDio(this.dio,this.loc);
Future getweather()async{
  try{
    var response=await dio.get("https://api.weatherapi.com/v1/forecast.json",
        queryParameters: {
          "key":"b0b59101e40d4d87896232617251702",
          "q":await loc.getCurrentLocation(),
          "days":1,
          "dt":DateTime.now(),
          "hour":DateTime.now().hour
        }
    );
    return response.data;
  }catch (e){
    throw "please connect the internet and try Again";
  }
}
Future update(var date)async{
  try{
  var response=await dio.get("https://api.weatherapi.com/v1/forecast.json",
      queryParameters: {
        "key":"b0b59101e40d4d87896232617251702",
        "q":await loc.getCurrentLocation(),
        "dt":date,
        "hour":DateTime.now().hour,
        "days":1
      }
  );

  return response.data;
}catch (e){
throw "please connect the internet and try Again";
}
}
Future getPrediction(List<int> features) async{
    final url = Uri.parse("http://192.168.203.40:5001/predict");

    // Create the POST request body
    Map<String, dynamic> body = {
      'features': features
    };

    // Send the POST request
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(body),
    );

print(response.statusCode);
    // Handle the response
  if (response.statusCode == 200) {
    print(response.body);
    final prediction = json.decode(response.body)['prediction'];
    if (kDebugMode) {
      return prediction;
    }
  } else {
    if (kDebugMode) {
      throw 'Failed to get prediction';
    }
  }
}
}