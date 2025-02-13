import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:ai_weather/feature/presention/screens/home.dart';
import 'package:ai_weather/feature/presention/screens/login.dart';
import 'package:ai_weather/feature/presention/screens/sign%20up.dart';

final router=GoRouter(routes: [
  GoRoute(path: "/",builder: (context,state)=>login_screen()),
  GoRoute(path: "/regester",builder: (context,state)=>sign_screen()),
  GoRoute(path: "/home",builder: (context,state){
    String user=state.extra.toString();
    return home_screen(user:user);
  }),
]);