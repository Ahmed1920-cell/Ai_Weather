import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/AuthBloc.dart';

class button extends StatelessWidget {
   button({super.key,required this.form_key,required this.email,required this.password,required this.name,this.signup=false});
final form_key;
final email;
final password;
final name;
bool signup;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue
        ),
        onPressed: ()async{
          if (form_key.currentState!.validate()) {
            // If the form is valid, proceed further
            if(!signup){
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Logging in...')),
            );
            await BlocProvider.of<AuthCubit>(context).login(email,password);}
            else{
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Signing Up...')),
              );
              await BlocProvider.of<AuthCubit>(context)
                  .register(email,password);
            }
            // Add login logic here
          }



        }, child: Text(name,style: TextStyle(color: Colors.black)));
  }
}
