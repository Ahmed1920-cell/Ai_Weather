import 'package:ai_weather/feature/Weather/domain/entity/WeatherEntity.dart';
import 'package:ai_weather/feature/Weather/presention/Bloc/WeatherBloc.dart';
import 'package:ai_weather/feature/Weather/presention/Bloc/WeatherState.dart';
import 'package:ai_weather/feature/Weather/presention/Screens/loading.dart';
import 'package:ai_weather/feature/auth/presention/bloc/AuthBloc.dart';
import 'package:ai_weather/feature/auth/presention/bloc/AuthState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'Error.dart';
import 'body.dart';
class home_screen extends StatefulWidget {
  home_screen({super.key, this.user=""});
String user;

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
   late WeatherEntity weatherEntity;
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    BlocProvider.of<WeatherCubit>(context).getweather() ;
    BlocProvider.of<AuthCubit>(context).getuser();
  }
  @override
  Widget build(BuildContext context) {
    if(context.watch<AuthCubit>().state is AuthInitial){
      context.go("/login");
    }
            return SafeArea(
                child: Scaffold(
                  floatingActionButton: FloatingActionButton(
                    backgroundColor: context.watch<WeatherCubit>().state is DoneState?Colors.blue:Colors.grey,
                    onPressed: (){
                      if (weatherEntity!=null){
                        print("hello");
                          BlocProvider.of<WeatherCubit>(context).prediction();
                         showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                            backgroundColor: Colors.blue,
                              title: Center(child:  Text('Prediction AI Weather')),
                              actions: <Widget>[
                              BlocBuilder<WeatherCubit,WeatherState>(
                                  builder: (context,state){
                                if(state is LoadingDialog){
                return loading();
              }
                                else if(state is ErrorDialog){
                                  return Center(child: IconButton(onPressed: (){BlocProvider.of<WeatherCubit>(context).prediction() ;}, icon: Icon(Icons.refresh,color: Colors.black,)));
                                }
              else {
                int predict=BlocProvider.of<WeatherCubit>(context).predict!;
                if(predict==0){
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(textAlign: TextAlign.center,"I advise you to stay at home because the weather the day is not good",style: TextStyle(fontSize: 15),),
                      SizedBox(height: MediaQuery.sizeOf(context).height * 5/776,),
                      ElevatedButton(onPressed: (){
                        Navigator.pop(context);
                      }, child: Text("Ok")),
                    ],
                  );
                }
                else{
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(textAlign: TextAlign.center,"The weather is good the day you can go down ",style: TextStyle(fontSize: 15),),
                      ElevatedButton(onPressed: (){
                        Navigator.pop(context);
                      }, child: Text("Ok")),
                    ],
                  );
                }
              }
                            })
                              ],
                            );
                          },
                        );
                    }
                      else{
                        null;
                      }
                    },child: Icon(Icons.directions_walk),),
                  backgroundColor: Colors.lightBlueAccent,
                  body: BlocConsumer<AuthCubit,AuthState>(
                    builder: (BuildContext context, state) {
                      print(context.watch<AuthCubit>().state);
                      return BlocBuilder<WeatherCubit,WeatherState>(builder: (context,state){
              if(state is ErrorState){
                return Error_screen(Error:state.error);
              }
              else if (state is DoneState){
                weatherEntity=BlocProvider.of<WeatherCubit>(context).weather!;
                return body_screen(weather: weatherEntity.forecast.forecastday[0],location:"${weatherEntity.location.name}" ,);
              }
              else {
                return loading();
              }
            });},
        listener: (context, state) async {
    if (state is AuthInitial) {
    context.go("/login");
    }
    else if(state is AuthError){
    ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(state.error)),
    );
    }},),
    ));

  }
}
