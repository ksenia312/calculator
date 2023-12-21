import 'package:calculator/uikit/custom_button.dart';
import 'package:flutter/material.dart';

import '../calculator_data.dart';

class BasicCalculatorButton extends StatelessWidget {
  const BasicCalculatorButton({super.key, required this.value});

  final String value;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      title: value,
      onPressed: () {
        CalculatorData.of(context).onChanged(value);
      },
    );
  }
}
