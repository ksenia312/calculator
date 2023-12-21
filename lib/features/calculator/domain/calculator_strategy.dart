import 'package:calculator/app/constants.dart';
import 'package:calculator/common/string_extension.dart';

import 'calculator_operators.dart';

abstract class CalculatorStrategy {
  const CalculatorStrategy();

  bool matches(String? element);

  List<String> add(
    String element, {
    required List<String> elements,
    required bool resultsState,
  });
}

class NumberCalculatorStrategy extends CalculatorStrategy {
  const NumberCalculatorStrategy();

  @override
  List<String> add(
    String element, {
    required List<String> elements,
    required bool resultsState,
  }) {
    final updated = List<String>.from(elements);
    final lastElement = updated.lastOrNull;

    if (CalculatorOperator.exist(lastElement)) {
      return updated..add(element);
    } else {
      if (resultsState) {
        return [element];
      }
      final number = '${lastElement ?? ''}$element';
      if (!number.isInBounds()) {
        return updated;
      }
      if (updated.isNotEmpty) {
        updated.removeLast();
      }

      return updated..add(number);
    }
  }

  @override
  bool matches(String? element) {
    return element != null ? double.tryParse(element) != null : false;
  }
}

class OperatorCalculatorStrategy extends CalculatorStrategy {
  const OperatorCalculatorStrategy();

  @override
  bool matches(String? element) {
    return CalculatorOperator.exist(element);
  }

  @override
  List<String> add(
    String element, {
    required List<String> elements,
    required bool resultsState,
  }) {
    if (elements.isEmpty) return [(AppConstants.zero), element];

    final updated = List<String>.from(elements);
    final previous = updated.lastOrNull;
    final previousWasAction = matches(previous);
    final previousWasPoint = previous?.endsWith(AppConstants.point) ?? false;

    if (previousWasAction || previousWasPoint) {
      updated.removeLast();
    }
    if (previousWasPoint) {
      updated.addAll(['$previous${AppConstants.zero}', element]);
    } else {
      updated.add(element);
    }

    return updated;
  }
}

class PointCalculatorStrategy extends CalculatorStrategy {
  const PointCalculatorStrategy();

  @override
  bool matches(String? element) {
    return element == AppConstants.point;
  }

  @override
  List<String> add(
    String element, {
    required List<String> elements,
    required bool resultsState,
  }) {
    final updated = List<String>.from(elements);
    final lastElement = updated.lastOrNull;

    if (lastElement?.contains(AppConstants.point) ?? false) {
      return updated;
    }
    if (updated.isEmpty) {
      return ['${AppConstants.zero}${AppConstants.point}'];
    }

    return updated
      ..removeLast()
      ..add('${lastElement ?? ''}$element');
  }
}

class PercentCalculatorStrategy extends CalculatorStrategy {
  const PercentCalculatorStrategy();

  @override
  bool matches(String? element) {
    return element == AppConstants.percent;
  }

  @override
  List<String> add(
    String element, {
    required List<String> elements,
    required bool resultsState,
  }) {
    final updated = List<String>.from(elements);
    final lastElement = updated.lastOrNull;

    if (lastElement == null) {
      return updated;
    }
    final parsed = double.tryParse(lastElement);

    if (parsed == null) {
      return updated;
    }

    return updated
      ..removeLast()
      ..add('${parsed / 100}');
  }
}
