import 'package:calculator/features/calculator/domain/calculator_value.dart';
import 'package:flutter/material.dart';

import '../calculator_data.dart';

class CalculatorDataWrapper extends StatefulWidget {
  const CalculatorDataWrapper({
    super.key,
    required this.builder,
    this.listener,
  });

  final VoidCallback? listener;
  final Widget Function(BuildContext) builder;

  @override
  State<CalculatorDataWrapper> createState() => _CalculatorDataWrapperState();
}

class _CalculatorDataWrapperState extends State<CalculatorDataWrapper> {
  late final _value = CalculatorValue.initialized()
    ..addListener(widget.listener ?? () {});

  @override
  Widget build(BuildContext context) {
    return CalculatorData(
      value: _value,
      onChanged: _onChanged,
      onSubmit: _onSubmit,
      onClear: _onClear,
      onRemoveLast: _onRemoveLast,
      child: Builder(
        builder: widget.builder,
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
