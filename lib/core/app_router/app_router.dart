import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:ai_weather/feature/Weather/presention/Screens/home.dart';
import 'package:ai_weather/feature/auth/presention/screens/login.dart';
import 'package:ai_weather/feature/auth/presention/screens/sign%20up.dart';

final router=GoRouter(routes: [
  GoRoute(path: "/",builder: (context,state)=>home_screen()),
  GoRoute(path: "/regester",builder: (context,state)=>sign_screen()),
  GoRoute(path: "/login",builder: (context,state){
    return login_screen();
  }),
]);