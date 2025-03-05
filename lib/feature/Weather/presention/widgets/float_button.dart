import 'package:ai_weather/feature/Weather/presention/widgets/text_bad.dart';
import 'package:ai_weather/feature/Weather/presention/widgets/text_good.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Bloc/WeatherBloc.dart';
import '../Bloc/WeatherState.dart';
import '../Screens/loading.dart';

class FloatButton extends StatelessWidget {
  const FloatButton({super.key});

  @override
  Widget build(BuildContext context) {
    if (context.watch<WeatherCubit>().state is DoneState) {
      return FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          BlocProvider.of<WeatherCubit>(context).prediction();
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Colors.blue,
                title: Center(child: Text('Prediction AI Weather')),
                actions: <Widget>[
                  BlocBuilder<WeatherCubit, WeatherState>(
                      builder: (context, state) {
                    if (state is LoadingDialog) {
                      return loading();
                    } else if (state is ErrorDialog) {
                      return Center(
                          child: IconButton(
                              onPressed: () {
                                BlocProvider.of<WeatherCubit>(context)
                                    .prediction();
                              },
                              icon: Icon(
                                Icons.refresh,
                                color: Colors.black,
                              )));
                    } else {
                      int predict =
                          BlocProvider.of<WeatherCubit>(context).predict!;
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          predict == 0 ? TextBad() : TextGood(),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 5 / 776,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Ok")),
                        ],
                      );
                    }
                  })
                ],
              );
            },
          );
        },
        child: Icon(Icons.directions_walk),
      );
    } else {
      return Placeholder();
    }
  }
}
