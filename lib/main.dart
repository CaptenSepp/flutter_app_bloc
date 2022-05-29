import 'package:flutter/material.dart';
import 'package:flutter_app_bloc/cubit/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/home_screen.dart';
import 'screens/second_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Bloc',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        routes: {
          '/': (context) => HomeScreen(
                title: 'HomeScreen',
                color: Colors.blue,
              ),
          '/second': (context) => const SecondScreen(
                title: 'SecondScreen',
                color: Colors.red,
              ),
        },
      ),
    );
  }
}
