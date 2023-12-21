import 'package:calculator/features/calculator/presentation/calculator_data.dart';
import 'package:flutter/material.dart';

enum CalculatorFieldType {
  working,
  result;

  bool get isWorking => this == CalculatorFieldType.working;
}

class CalculatorFieldWrapper extends StatelessWidget {
  const CalculatorFieldWrapper({
    super.key,
    required this.fieldType,
    required this.child,
  });

  final CalculatorFieldType fieldType;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final large = theme.headlineLarge!;
    final small = theme.titleMedium!;
    final idleStyle = fieldType.isWorking ? large : small;
    final resultStyle = fieldType.isWorking ? small : large;
    return AnimatedDefaultTextStyle(
      duration: const Duration(milliseconds: 100),
      style: CalculatorData.of(context).isResult ? resultStyle : idleStyle,
      child: child,
    );
  }
}
