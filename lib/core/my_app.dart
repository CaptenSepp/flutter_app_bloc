import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/counter_cubit.dart';
import '../screens/home_screen.dart';
import '../screens/second_screen.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final CounterCubit _counterCubit = CounterCubit();

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
          '/': (context) => BlocProvider.value(
                value: _counterCubit,
                child: HomeScreen(
                  title: 'HomeScreen',
                  color: Colors.blue,
                ),
              ),
          '/second': (context) => BlocProvider.value(
                value: _counterCubit,
                child: const SecondScreen(
                  title: 'SecondScreen',
                  color: Colors.red,
                ),
              ),
        },
      ),
    );
  }
}
