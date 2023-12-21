import 'package:calculator/app/constants.dart';
import 'package:calculator/features/calculator/domain/calculator_operators.dart';

import 'basic_button.dart';
import 'cancel_button.dart';
import 'equals_button.dart';
import 'remove_last_button.dart';

abstract class CalculatorButtons {
  static final plus = BasicCalculatorButton(
    value: CalculatorOperator.plus.name,
  );
  static final minus = BasicCalculatorButton(
    value: CalculatorOperator.minus.name,
  );
  static final divider = BasicCalculatorButton(
    value: CalculatorOperator.divider.name,
  );
  static final multiplier = BasicCalculatorButton(
    value: CalculatorOperator.multiplier.name,
  );
  static const zero = BasicCalculatorButton(
    value: AppConstants.zero,
  );
  static const point = BasicCalculatorButton(
    value: AppConstants.point,
  );
  static const percent = BasicCalculatorButton(
    value: AppConstants.percent,
  );
  static const equals = EqualsButton();

  static const cancel = CancelButton();

  static const removeLast = RemoveLastButton();

  static Iterable<BasicCalculatorButton> numbersRange(
    int start, [
    int length = 3,
  ]) {
    return List.generate(3, (index) => start + index).map(
      (e) => BasicCalculatorButton(value: '$e'),
    );
  }
}
