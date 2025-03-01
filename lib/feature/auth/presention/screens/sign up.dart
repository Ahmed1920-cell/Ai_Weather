import 'package:ai_weather/core/app_router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ai_weather/feature/auth/presention/bloc/AuthBloc.dart';
import 'package:ai_weather/feature/auth/presention/bloc/AuthState.dart';
import 'package:go_router/go_router.dart';

import '../../../Weather/presention/Screens/home.dart';
import '../widgets/button.dart';
import '../widgets/textfield.dart';

class sign_screen extends StatefulWidget {
  const sign_screen({super.key});

  @override
  State<sign_screen> createState() => _sign_screenState();
}

class _sign_screenState extends State<sign_screen> {

  TextEditingController name=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController phone=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool show_Password=false;
  IconData icon=Icons.visibility_off;

  String? _valid_name(String? value){
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    } else if (!RegExp(r"^[a-zA-Z][a-zA-Z0-9 ._]{2,19}$")
        .hasMatch(value)) {
      return 'Please enter a valid name';
    }
    return null;
  }
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
  String? valid_phone(String? value){
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }else if (!RegExp(r'^\d+$')
        .hasMatch(value)) {
      return 'Please enter a valid email';
    }return null;
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

      return WillPopScope(
        onWillPop: () async {
          context.go("/"); // Handle system back button
          return false; // Prevent default behavior (so GoRouter handles it)
        },
        child: SafeArea(
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
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Sign up",style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold
                      ),),
                      SizedBox(
                        height: 20,
                      ),
                      field(controller: name, valid: _valid_name, hint: "Enter the Username", type_input: TextInputType.text, label: "Username"),
                      SizedBox(
                        height: 20,
                      ),
                      field(controller: email, valid: valid_email, hint: "Enter the email", type_input: TextInputType.emailAddress, label: "email"),
                      SizedBox(
                        height: 20,
                      ),
                      field(controller: password, valid: valid_password, hint: "Enter the password", type_input: TextInputType.text, label: "Password",password: true,),
                      SizedBox(
                        height: 20,
                      ),
                      field(controller: phone, valid: valid_phone, hint: "Enter the phone", type_input: TextInputType.number, label: "Phone",),

                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 50,
                        width: 200,
                        child: button(form_key: _formKey, email: email.text, password: password.text, name: "Sign up",signup: true,),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );

    },
    );
  }
}
