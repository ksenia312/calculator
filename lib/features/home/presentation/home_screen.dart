import 'package:calculator/features/calculator/presentation/calculator_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body:CalculatorWidget(),
    );
  }
}
