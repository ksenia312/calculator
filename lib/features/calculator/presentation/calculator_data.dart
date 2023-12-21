import 'package:calculator/features/calculator/domain/calculator_value.dart';
import 'package:flutter/material.dart';

class CalculatorData extends InheritedWidget {
  const CalculatorData({
    super.key,
    required super.child,
    required this.value,
    required this.onChanged,
    required this.onSubmit,
    required this.onClear,
    required this.onRemoveLast,
  });

  static CalculatorData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CalculatorData>();
  }

  static CalculatorData of(BuildContext context) {
    final CalculatorData? result = maybeOf(context);
    assert(result != null, 'No CalculatorStore found in context');
    return result!;
  }

  final CalculatorValue value;
  final ValueChanged<String> onChanged;
  final VoidCallback onSubmit;
  final VoidCallback onClear;
  final VoidCallback onRemoveLast;


  @override
  bool updateShouldNotify(covariant CalculatorData oldWidget) {
    return oldWidget.value != value;
  }
}
