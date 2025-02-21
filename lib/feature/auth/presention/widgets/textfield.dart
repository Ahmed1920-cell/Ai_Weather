import 'package:ai_weather/feature/auth/presention/bloc/AuthBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class field extends StatelessWidget {
   field({super.key,required this.controller,required this.valid,required this.hint,required this.type_input,required this.label,this.password=false});
var controller;
var valid;
var hint;
var label;
var type_input;
bool password;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        hintText: hint,
        labelText: label,
          prefix: password?IconButton(onPressed:(){
            BlocProvider.of<AuthCubit>(context).togglePasswordVisibility();
          } , icon: Icon(BlocProvider.of<AuthCubit>(context).prefix)):null
      ),

      controller: controller,
      keyboardType: type_input,
      validator: valid,
      obscureText: password?BlocProvider.of<AuthCubit>(context).isPasswordVisible:false,

    );
  }
}
