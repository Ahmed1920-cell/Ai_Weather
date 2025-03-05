import 'package:ai_weather/core/network/Dio.dart';
import 'package:ai_weather/core/network/location.dart';
import 'package:ai_weather/feature/Weather/data/DataSource/WeatherDataRemote.dart';
import 'package:ai_weather/feature/Weather/data/repositry/WeatherRepoImp.dart';
import 'package:ai_weather/feature/Weather/domain/repositry/WeatherRepo.dart';
import 'package:ai_weather/feature/Weather/domain/usecase/get_weather_usecase.dart';
import 'package:ai_weather/feature/Weather/domain/usecase/predict_usecase.dart';
import 'package:ai_weather/feature/Weather/domain/usecase/update_weather_usecase.dart';
import 'package:ai_weather/feature/Weather/presention/Bloc/WeatherBloc.dart';
import 'package:ai_weather/feature/auth/domain/usecase/getUser_usecase.dart';
import 'package:ai_weather/feature/auth/domain/usecase/logout_usecase.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:ai_weather/feature/auth/data/data%20source/AuthDataRemote.dart';
import 'package:ai_weather/feature/auth/domain/repositry/AuthRepo.dart';
import 'package:ai_weather/feature/auth/presention/bloc/AuthBloc.dart';

import '../../feature/auth/data/repositry/AuthRepoImp.dart';
import 'package:ai_weather/core/firebase/firebase_service.dart';
import 'package:ai_weather/feature/auth/domain/usecase/login_usecase.dart';
import 'package:ai_weather/feature/auth/domain/usecase/signup_usecase.dart';
final sl = GetIt.instance;

void intl() {
  //Auth
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton<FirebaseService>(() => FirebaseService(sl<FirebaseAuth>()));
  sl.registerLazySingleton(() => AuthDataRemote(sl<FirebaseService>()));
  sl.registerLazySingleton<AuthRepo>(() =>AuthRepoImp(sl<AuthDataRemote>()));
  sl.registerLazySingleton(() =>LoginUsecase(sl<AuthRepo>()));
  sl.registerLazySingleton(() =>SignupUsecase(sl<AuthRepo>()));
  sl.registerLazySingleton(() =>LoginOutUsecase(sl<AuthRepo>()));
  sl.registerLazySingleton(() =>GetUserUsecase(sl<AuthRepo>()));
  sl.registerFactory(() =>AuthCubit(sl<LoginUsecase>(),sl<SignupUsecase>(),sl<LoginOutUsecase>(),sl<GetUserUsecase>()));

//Weather
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => location());
  sl.registerLazySingleton(() => WeatherDio(sl<Dio>(),sl<location>()));
  sl.registerLazySingleton(() => WeatherDataRemote(sl<WeatherDio>()));
  sl.registerLazySingleton<WeatherRepo>(() =>WeatherRepoImp(sl<WeatherDataRemote>()));
  sl.registerLazySingleton(() =>GetWeatherUsecase(sl<WeatherRepo>()));
  sl.registerLazySingleton(() =>UpdateWeatherUsecase(sl<WeatherRepo>()));
  sl.registerLazySingleton(() =>PredictUsecase(sl<WeatherRepo>()));
  sl.registerFactory(() =>WeatherCubit(sl<GetWeatherUsecase>(),sl<UpdateWeatherUsecase>(),sl<PredictUsecase>()));
}