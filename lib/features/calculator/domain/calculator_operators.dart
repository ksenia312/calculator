enum CalculatorOperator {
  plus('+'),
  minus('-'),
  divider('÷'),
  multiplier('×');

  const CalculatorOperator(this.name);

  static bool exist(String? value) {
    if (value == null) return false;
    return fromString(value) != null;
  }

  static CalculatorOperator? fromString(String value) {
    try {
      return CalculatorOperator.values.firstWhere(
        (element) => element.name == value,
      );
    } catch (_) {
      return null;
    }
  }

  final String name;

  double calculate(double value1, double value2) {
    return switch (this) {
      (CalculatorOperator.plus) => value1 + value2,
      (CalculatorOperator.minus) => value1 - value2,
      (CalculatorOperator.multiplier) => value1 * value2,
      (CalculatorOperator.divider) => value1 / value2,
    };
  }
}

extension OperationExtension on CalculatorOperator? {
  bool get isPrimary =>
      this == CalculatorOperator.multiplier ||
      this == CalculatorOperator.divider;
}
