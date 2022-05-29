import 'package:flutter/material.dart';
import 'package:flutter_app_bloc/cubit/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Bloc'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.wasIncremented == true) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Incremented',
                      ),
                      duration: Duration(seconds: 1),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Decremented',
                      ),
                      duration: Duration(seconds: 1),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state.counterValue == 5) {
                  return Text(
                    '${state.counterValue} wow',
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else {
                  return Text(
                    state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                }
              },
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  child: const Icon(Icons.remove),
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                    // context.read<CounterCubit>().decrement();
                  },
                ),
                FloatingActionButton(
                  child: const Icon(Icons.add),
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                ),
              ],
            ),
            ElevatedButton(key: const Key('1'),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => BlocProvider.value(
                    value: BlocProvider.of<CounterCubit>(context),
                    child: const SecondScreen(),
                  ),
                ),
              ),
              child: const Icon(Icons.navigate_next_rounded),
            )
          ],
        ),
      ),
    );
  }
}
