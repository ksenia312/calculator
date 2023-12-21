import 'package:calculator/app/constants.dart';
import 'package:calculator/uikit/custom_button.dart';
import 'package:flutter/material.dart';

import '../calculator_data.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      title: AppConstants.clear,
      onPressed: CalculatorData.of(context).onClear,
    );
  }
}
