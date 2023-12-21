import 'package:calculator/app/constants.dart';
import 'package:calculator/common/string_extension.dart';
import 'package:calculator/features/calculator/domain/calculator_operators.dart';
import 'package:calculator/features/calculator/domain/calculator_result.dart';
import 'package:flutter/cupertino.dart';

import 'calculator_strategy.dart';

part 'calculator_value_extension.dart';

class CalculatorValue {
  CalculatorValue.initialized({
    List<String>? initialValue,
    this.strategies = const [
      NumberCalculatorStrategy(),
      OperatorCalculatorStrategy(),
      PointCalculatorStrategy(),
      PercentCalculatorStrategy(),
    ],
  }) {
    _elements = ValueNotifier(initialValue ?? [])
      ..addListener(_elementsListener);
    _result = CalculatorResult();
  }

  late final ValueNotifier<List<String>> _elements;
  late final CalculatorResult _result;

  final List<CalculatorStrategy> strategies;

  @override
  bool operator ==(Object other) {
    return other is CalculatorValue &&
        (other._elements == _elements) &&
        (other._result == _result);
  }

  @override
  int get hashCode => _elements.hashCode * _result.hashCode;

  void add(String element) {
    for (final strategy in strategies) {
      if (strategy.matches(element)) {
        _elements.value = strategy.add(element, symbols: _elements.value);
        return;
      }
    }
  }

  void clear() {
    _elements.value = [];
  }

  void removeLast() {
    final lastValue = _elements.value.lastOrNull;
    if (lastValue != null) {
      final replacement = lastValue.length > 1
          ? lastValue.substring(0, lastValue.length - 1)
          : null;
      final newValue = [..._elements.value]..removeLast();
      if (replacement != null) {
        newValue.add(
          lastValue.substring(0, lastValue.length - 1),
        );
      }
      _elements.value = newValue;
    }
  }

  void submit() {
    if (_result.value != null) {
      if (_result.isError) {
        _elements.value = [];
      } else {
        _elements.value = [_result.value!];
      }
    }
  }

  void _elementsListener() => _result.updateWith(this);
}
