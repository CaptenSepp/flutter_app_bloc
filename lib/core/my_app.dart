import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/counter_cubit.dart';
import '../screens/home_screen.dart';
import '../screens/second_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
                child: const HomeScreen(
                  title: 'HomeScreen',
                  // color: Colors.blue,
                ),
              ),
          '/second': (context) => BlocProvider.value(
                value: _counterCubit,
                child: const SecondScreen(
                  title: 'SecondScreen',
                  // color: Colors.red,
                ),
              ),
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
