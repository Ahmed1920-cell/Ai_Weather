import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/assets/componant.dart';
import '../../../auth/presention/bloc/AuthBloc.dart';
import '../Bloc/WeatherBloc.dart';

class Header extends StatelessWidget {
   Header({super.key,required this.user});
String user;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(user,style: TextStyle(fontSize: size,color: Colors.black,fontWeight: FontWeight.bold),),
            Text("Last Update : ${DateTime.now().hour}:${DateTime.now().minute}",style: TextStyle(fontSize: 14,color: Colors.black),),
          ],
        ),
        Spacer(),
        Row(
          children: [
            IconButton(onPressed: (){BlocProvider.of<WeatherCubit>(context).getweather() ;}, icon: Icon(Icons.refresh,color: Colors.black,)),
            IconButton(onPressed: (){
              BlocProvider.of<AuthCubit>(context).logout();
            }, icon: Icon(Icons.logout,color: Colors.black,)),
          ],
        )
      ],
    );
  }
}
