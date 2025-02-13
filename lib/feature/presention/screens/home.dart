import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/AuthBloc.dart';
import '../bloc/AuthState.dart';
class home_screen extends StatelessWidget {
  home_screen({super.key, this.user=""});
String user;

  @override
  Widget build(BuildContext context) {
      return BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) async {
        if (state is AuthInitial) {
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
                  backgroundColor: Colors.orange,
                  appBar: AppBar(
                    actions: [
                      IconButton(onPressed: ()  {
BlocProvider.of<AuthCubit>(context).logout();
                      }, icon: Icon(Icons.logout))
                    ],
                    backgroundColor: Colors.white,
                    elevation: 0,
                  ),
                  body: Container(
                    padding: EdgeInsets.all(30),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(bottomLeft:Radius.circular(30),bottomRight: Radius.circular(30)),
                    ),
                    height: MediaQuery.sizeOf(context).height*3/4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Hi: "+user
                          ,style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text("  Welcome in\n Home Screen"
                          ,style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),
                ));
      }

      );



  }
}
