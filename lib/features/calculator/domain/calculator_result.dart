import 'package:calculator/app/constants.dart';
import '../use_case/on_calculate_result_use_case.dart';
import 'calculator_value.dart';

class CalculatorResult {
  String? _result;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    return other is CalculatorResult && (other.value == value);
  }

  String? get value => _result;

  bool get isError => _result == AppConstants.error;

  void updateWith(CalculatorValue calculatorValue) {
    try {
      _result = _format(OnCalculateResultUseCase(calculatorValue).call());
    } catch (_) {
      _result = AppConstants.error;
    }
  }

  String _format(double? result) {
    if (result == null) return '';
    final hasDecimal = result != result.toInt().toDouble();
    return (hasDecimal ? '$result' : result.toStringAsFixed(0));
  }
}
