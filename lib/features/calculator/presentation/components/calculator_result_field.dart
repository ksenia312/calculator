import 'package:calculator/app/constants.dart';
import 'package:calculator/features/calculator/domain/calculator_value.dart';
import 'package:calculator/features/calculator/presentation/wrapper/calculator_field_wrapper.dart';
import 'package:flutter/material.dart';

class CalculatorResultField extends StatelessWidget {
  const CalculatorResultField(this.calculatorValue, {super.key});

  final CalculatorValue calculatorValue;

  @override
  Widget build(BuildContext context) {
    return CalculatorFieldWrapper(
      fieldType: CalculatorFieldType.result,
      child: Text(
        '${AppConstants.equals} ${calculatorValue.resultField}',
        textAlign: TextAlign.end,
      ),
    );
  }
}
