import 'package:calculator/app/constants.dart';
import 'package:flutter/gestures.dart';
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
  late final _value = CalculatorValue.initialized()..addListener(_animate);
  final _controller = ScrollController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animate();
    });
    super.initState();
  }

  void _animate() {
    if (_controller.hasClients) {
      _controller.jumpTo(_controller.position.maxScrollExtent);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Align(
      alignment: Alignment.bottomCenter,
      child: CalculatorData(
        value: _value,
        onChanged: _onChanged,
        onSubmit: _onSubmit,
        onClear: _onClear,
        onRemoveLast: _onRemoveLast,
        child: Builder(builder: (context) {
          final calculatorValue = CalculatorData.of(context).value;
          return Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 0, 12, 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: ListView(
                      controller: _controller,
                      dragStartBehavior: DragStartBehavior.down,
                      shrinkWrap: true,
                      children: [
                        AnimatedDefaultTextStyle(
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
                Align(
                  alignment: Alignment.bottomCenter,
                  child: GridView.count(
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
                ),
              ],
            ),
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
