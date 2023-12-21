import 'package:calculator/features/calculator/domain/calculator_value.dart';
import 'package:calculator/features/calculator/presentation/wrapper/calculator_field_wrapper.dart';
import 'package:flutter/material.dart';

class CalculatorWorkingField extends StatelessWidget {
  const CalculatorWorkingField(this.calculatorValue, {super.key});

  final CalculatorValue calculatorValue;

  @override
  Widget build(BuildContext context) {
    return CalculatorFieldWrapper(
      fieldType: CalculatorFieldType.working,
      child: Wrap(
        alignment: WrapAlignment.end,
        crossAxisAlignment: WrapCrossAlignment.end,
        children: [
          ...calculatorValue.mainField.map(
            (e) => Text(
              e,
              textAlign: TextAlign.end,
              softWrap: true,
              maxLines: 1,
            ),
          )
        ],
      ),
    );
  }
}
