part of 'calculator_value.dart';

extension CalculatorSymbolsListExtension on CalculatorValue {
  double? get first {
    return numberAt(0);
  }

  double? get last {
    return numberAt(_elements.value.length - 1);
  }

  int? get lastIndex {
    final length = _elements.value.length;
    if (length == 0) return null;
    return length - 1;
  }

  double? numberAt(int index) {
    try {
      return double.parse(_elements.value[index]);
    } catch (_) {
      return null;
    }
  }

  CalculatorOperator? operatorAt(int index) {
    try {
      return CalculatorOperator.fromString(_elements.value[index]);
    } catch (_) {
      return null;
    }
  }
}

extension CalculatorValuePreviewExtension on CalculatorValue {
  List<String> get mainField {
    if (_elements.value.isEmpty) return [AppConstants.zero];
    return [
      ..._elements.value.map((e) {
        if (double.tryParse(e) != null) {
          return e.formattedDouble;
        }
        return e;
      })
    ];
  }

  String get resultField {
    return _result.isError
        ? _result.value ?? ''
        : _result.value.formattedDouble;
  }
}
