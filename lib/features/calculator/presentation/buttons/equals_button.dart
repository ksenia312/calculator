import 'package:calculator/app/constants.dart';
import 'package:calculator/uikit/custom_button.dart';
import 'package:flutter/material.dart';

import '../calculator_data.dart';

class EqualsButton extends StatelessWidget {
  const EqualsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      title: AppConstants.equals,
      onPressed: CalculatorData.of(context).onSubmit,
    );
  }
}
