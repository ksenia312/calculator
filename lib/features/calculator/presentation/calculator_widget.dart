import 'package:calculator/app/constants.dart';
import 'package:flutter/material.dart';

import '../domain/calculator_value.dart';
import 'buttons/calculator_buttons.dart';
import 'calculator_data.dart';

class CalculatorWidget extends StatefulWidget {
  const CalculatorWidget({super.key});

  @override
  State<CalculatorWidget> createState() => _CalculatorWidgetState();
}

class _CalculatorWidgetState extends State<CalculatorWidget> {
  final _value = CalculatorValue.initialized();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(12),
      child: CalculatorData(
        value: _value,
        onChanged: _onChanged,
        onSubmit: _onSubmit,
        onClear: _onClear,
        onRemoveLast: _onRemoveLast,
        child: Builder(builder: (context) {
          final calculatorValue = CalculatorData.of(context).value;
          return Column(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Flexible(
                        child: AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 100),
                          style: calculatorValue.isResult
                              ? theme.titleMedium!
                              : theme.headlineMedium!,
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
                        ),
                      ),
                      const SizedBox(height: 4),
                      AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 100),
                        style: calculatorValue.isResult
                            ? theme.headlineLarge!
                            : theme.titleMedium!,
                        child: Text(
                          '${AppConstants.equals} ${calculatorValue.resultField}',
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 4,
                crossAxisSpacing: 12,
                physics: const NeverScrollableScrollPhysics(),
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
            ],
          );
        }),
      ),
    );
  }

  void _onChanged(String element) {
    setState(() {
      _value.add(element);
    });
  }

  void _onRemoveLast() {
    setState(() {
      _value.removeLast();
    });
  }

  void _onSubmit() {
    setState(() {
      _value.isResult = true;
    });
  }

  void _onClear() {
    setState(() {
      _value.clear();
    });
  }
}
