import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_app_bloc/cubit/counter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterCubit', () {
    CounterCubit counterCubit;
    counterCubit = CounterCubit();

    setUp(() {
      counterCubit = CounterCubit();
    });

    tearDown(() {
      counterCubit.close();
    });
    test('the initail state for CounterCubit is CounterState (counterValue :0)',
        () {
      expect(counterCubit.state, CounterState(counterValue: 0));
    });
  });
}
