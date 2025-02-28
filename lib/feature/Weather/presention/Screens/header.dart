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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Hello",style: TextStyle(fontSize: size,color: orange,fontWeight: FontWeight.bold),),
        ),
        Spacer(),
        Row(
          children: [
            IconButton(onPressed: (){BlocProvider.of<WeatherCubit>(context).getweather() ;}, icon: Icon(Icons.refresh)),
            IconButton(onPressed: (){
              BlocProvider.of<AuthCubit>(context).logout();
            }, icon: Icon(Icons.logout)),
          ],
        )
      ],
    );
  }
}
