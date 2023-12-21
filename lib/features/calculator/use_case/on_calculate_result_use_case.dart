import '../domain/calculator_operators.dart';
import '../domain/calculator_value.dart';

class OnCalculateResultUseCase {
  OnCalculateResultUseCase(this.calculatorValue);

  final CalculatorValue calculatorValue;
  final tempResults = <double>[];
  final tempOperators = <CalculatorOperator>[];
  late final lastIndex = calculatorValue.lastIndex;

  CalculatorOperator? previousOperator;
  double? previousResult;

  double? call() {
    if (lastIndex != null) {
      for (int i = 0; i <= lastIndex!; i++) {
        final operator = calculatorValue.operatorAt(i);
        final number = calculatorValue.numberAt(i);
        if (operator != null) {
          _processPreviousOperator();
          previousOperator = operator;
          previousResult = 0.0;
        } else if (number != null) {
          previousResult = number;
        }
      }

      // Apply the previous operator if this wasn't last in expression
      if (calculatorValue.operatorAt(lastIndex!) == null) {
        _processPreviousOperator();
      }
    }

    double result = tempResults.firstOrNull ?? 0;
    for (var i = 1; i < tempResults.length; i++) {
      result = tempOperators[i - 1].calculate(result, tempResults[i]);
    }

    return result;
  }

  void _processPreviousOperator() {
    if (previousResult != null) {
      if (previousOperator != null && previousOperator.isPrimary) {
        final lastTempResult = tempResults.lastOrNull;
        if (lastTempResult != null && tempResults.isNotEmpty) {
          tempResults
            ..removeLast()
            ..add(
              previousOperator!.calculate(lastTempResult, previousResult!),
            );
        }
      } else {
        tempResults.add(previousResult!);
        if (previousOperator != null) {
          tempOperators.add(previousOperator!);
        }
      }
    }
  }
}
