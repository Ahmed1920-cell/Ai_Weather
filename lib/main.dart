import 'package:ai_weather/core/network/location.dart';
import 'package:ai_weather/feature/Weather/presention/Bloc/WeatherBloc.dart';
import 'package:ai_weather/feature/Weather/presention/Screens/home.dart';
import 'package:ai_weather/feature/Weather/presention/widgets/easy_date.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ai_weather/feature/auth/presention/bloc/AuthBloc.dart';

import 'core/app_router/app_router.dart';
import 'core/dl/Dependency_Injection.dart';


// ...



void main() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  intl();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [BlocProvider(
        create: (context) => sl<WeatherCubit>()),BlocProvider(
    create: (context) => sl<AuthCubit>())], child:  MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: router),

    );

      /*BlocProvider(
      create: (context) => sl<WeatherCubit>(),
child: MaterialApp(
  home: home_screen(),
)

MaterialApp.router(
  debugShowCheckedModeBanner: false,
    routerConfig: router),
    );*/
  }
}
