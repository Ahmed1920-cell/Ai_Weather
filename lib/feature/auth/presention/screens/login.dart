import 'dart:convert';

import 'package:ai_weather/feature/auth/presention/widgets/button.dart';
import 'package:ai_weather/feature/auth/presention/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ai_weather/core/app_router/app_router.dart';
import 'package:ai_weather/feature/auth/presention/bloc/AuthBloc.dart';
import 'package:ai_weather/feature/auth/presention/bloc/AuthState.dart';



class login_screen extends StatefulWidget {
  const login_screen({super.key});

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String er="";
bool show_Password=false;
IconData icon=Icons.visibility_off;
  String? valid_email(String? value){
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}")
        .hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }
  String? valid_password(String? value){
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) async {
      if (state is AuthSucces) {
        context.go("/");
      }
      else if(state is AuthError){
        ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content: Text(state.error)),
        );
      }
    }, builder: (BuildContext context,  state) {

            return SafeArea(
              child: Scaffold(
                backgroundColor: Colors.lightBlueAccent,
                body: Container(
                  padding: EdgeInsets.all(30),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(bottomLeft:Radius.circular(30),bottomRight: Radius.circular(30)),
                  ),
                  height: MediaQuery.sizeOf(context).height*3/4,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("login",
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        field(controller: email, valid: valid_email, hint: "Enter the email", type_input: TextInputType.emailAddress, label: "email")
                        ,
                        SizedBox(
                          height: 20,
                        ),
                        field(controller: password, valid: valid_password, hint: "Enter the password", type_input: TextInputType.text, label: "Password",password: true,),
                        SizedBox(
                          height: 20,
                        ),
                        button(form_key: _formKey, email: email.text, password: password.text, name: "Login"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("I don't have already account?"),
                            TextButton(onPressed: (){
                             context.go("/regester");
                            }, child: Text("Register",style: TextStyle(color: Colors.blue),)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );

    },
    );
  }
}
