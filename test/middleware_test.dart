import 'dart:math';

import 'package:counter/main.dart';
import 'package:redux_saga/redux_saga.dart';
import 'package:test/test.dart';

void main() {
  group('Counter Middleware Tests', () {
    test('incrementAsync Test', () {
      Iterator iterator = incrementAsync().iterator;

      iterator.moveNext();

      //counter Saga must call Delay(Duration(seconds: 1))
      expect(iterator.current, TypeMatcher<Delay>());
      expect(iterator.current.duration, Duration(seconds: 1));

      iterator.moveNext();

      //counter Saga must dispatch an INCREMENT action
      expect(iterator.current, TypeMatcher<Put>());
      expect(iterator.current.action, TypeMatcher<IncrementAction>());

      //counter Saga must be done
      expect(iterator.moveNext(), false);
    });
  });
}
