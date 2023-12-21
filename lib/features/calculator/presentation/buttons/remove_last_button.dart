import 'package:calculator/app/constants.dart';
import 'package:calculator/uikit/custom_button.dart';
import 'package:flutter/material.dart';

import '../calculator_data.dart';

class RemoveLastButton extends StatelessWidget {
  const RemoveLastButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      title: AppConstants.removeLast,
      onPressed: CalculatorData.of(context).onRemoveLast,
    );
  }
}
