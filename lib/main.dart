import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ai_weather/feature/presention/bloc/AuthBloc.dart';

import 'core/app_router/app_router.dart';
import 'core/dl/Dependency_Injection.dart';


// ...



void main() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  intl();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthCubit>(),
child: MaterialApp.router(
  debugShowCheckedModeBanner: false,
    routerConfig: router),
    );
  }
}
