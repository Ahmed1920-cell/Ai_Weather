import 'package:ai_weather/feature/domain/usecase/logout_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:ai_weather/feature/data/data%20source/AuthDataRemote.dart';
import 'package:ai_weather/feature/domain/repositry/AuthRepo.dart';
import 'package:ai_weather/feature/presention/bloc/AuthBloc.dart';

import '../../feature/data/repositry/AuthRepoImp.dart';
import 'package:ai_weather/core/firebase/firebase_service.dart';
import 'package:ai_weather/feature/domain/usecase/login_usecase.dart';
import 'package:ai_weather/feature/domain/usecase/signup_usecase.dart';
final sl = GetIt.instance;

void intl() {
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton<FirebaseService>(() => FirebaseService(sl<FirebaseAuth>()));
  sl.registerLazySingleton(() => AuthDataRemote(sl<FirebaseService>()));
  sl.registerLazySingleton<AuthRepo>(() =>AuthRepoImp(sl<AuthDataRemote>()));
  sl.registerLazySingleton(() =>LoginUsecase(sl<AuthRepo>()));
  sl.registerLazySingleton(() =>SignupUsecase(sl<AuthRepo>()));
  sl.registerLazySingleton(() =>LoginOutUsecase(sl<AuthRepo>()));
  sl.registerFactory(() =>AuthCubit(sl<LoginUsecase>(),sl<SignupUsecase>(),sl<LoginOutUsecase>()));
}