import 'package:calculator/common/scroll_controller_extension.dart';
import 'package:calculator/features/calculator/presentation/calculator_data.dart';
import 'package:calculator/features/calculator/presentation/components/calculator_working_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'buttons/calculator_buttons.dart';
import 'components/calculator_result_field.dart';
import 'wrapper/calculator_data_wrapper.dart';
import 'wrapper/calculator_scroll_controller_wrapper.dart';

class CalculatorWidget extends StatefulWidget {
  const CalculatorWidget({super.key});

  @override
  State<CalculatorWidget> createState() => _CalculatorWidgetState();
}

class _CalculatorWidgetState extends State<CalculatorWidget> {
  @override
  Widget build(BuildContext context) {
    return CalculatorScrollControllerWrapper(
      builder: (context, controller) {
        return CalculatorDataWrapper(
          listener: controller.scrollToEnd,
          builder: (context) {
            return Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 0, 12, 12),
                child: _CalculatorBody(controller: controller),
              ),
            );
          },
        );
      },
    );
  }
}

class _CalculatorBody extends StatelessWidget {
  const _CalculatorBody({required this.controller});

  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    final calculatorValue = CalculatorData.of(context).value;
    final screenSize = MediaQuery.sizeOf(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Align(
            alignment: Alignment.bottomRight,
            child: ListView(
              controller: controller,
              dragStartBehavior: DragStartBehavior.down,
              shrinkWrap: true,
              children: [
                CalculatorWorkingField(calculatorValue),
                const SizedBox(height: 4),
                CalculatorResultField(calculatorValue),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        Align(
          alignment: Alignment.bottomCenter,
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 4,
            crossAxisSpacing: 12,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: screenSize.width * 2.5 / screenSize.height,
            mainAxisSpacing: 12,
            children: [
              CalculatorButtons.cancel,
              CalculatorButtons.removeLast,
              CalculatorButtons.percent,
              CalculatorButtons.divider,
              //
              ...CalculatorButtons.numbersRange(7),
              CalculatorButtons.multiplier,
              //
              ...CalculatorButtons.numbersRange(4),
              CalculatorButtons.plus,
              //
              ...CalculatorButtons.numbersRange(1),
              CalculatorButtons.minus,
              //
              CalculatorButtons.plus,
              CalculatorButtons.zero,
              CalculatorButtons.point,
              CalculatorButtons.equals,
            ],
          ),
        ),
      ],
    );
  }
}
