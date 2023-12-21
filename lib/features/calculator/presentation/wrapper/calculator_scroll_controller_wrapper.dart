import 'package:calculator/common/scroll_controller_extension.dart';
import 'package:flutter/material.dart';

class CalculatorScrollControllerWrapper extends StatefulWidget {
  const CalculatorScrollControllerWrapper({
    super.key,
    required this.builder,
  });

  final Widget Function(BuildContext, ScrollController) builder;

  @override
  State<CalculatorScrollControllerWrapper> createState() =>
      _CalculatorScrollControllerWrapperState();
}

class _CalculatorScrollControllerWrapperState
    extends State<CalculatorScrollControllerWrapper> {
  final _controller = ScrollController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.scrollToEnd();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _controller);
  }
}
