import 'package:calculator/app/constants.dart';

extension StringDoubleExtension on String? {
  String get formattedDouble {
    if (!_checkIfDouble(this)) {
      return AppConstants.zero;
    }
    if (this!.contains('e') || this!.contains('E')) return this!;

    return _addCommasTo(this!);
  }

  bool isInBounds({int integralBound = 16, int fractionBound = 16}) {
    if (!_checkIfDouble(this)) return true;

    List<String> parts = this!.split(AppConstants.point);

    String integralPart = parts[0];
    String fractionalPart = parts.length > 1 ? parts[1] : "";

    return integralPart.length <= integralBound &&
        fractionalPart.length <= fractionBound;
  }

  bool _checkIfDouble(String? value) {
    return value != null && value.isNotEmpty && double.tryParse(value) != null;
  }

  String _addCommasTo(String value) {
    final parts = value.split(AppConstants.point);
    final beforeDecimal = parts[0].split('')..remove(AppConstants.hyphen);
    final reversedBeforeDecimal = beforeDecimal.reversed.join();

    var formattedReversed = '';
    for (int i = 0; i < reversedBeforeDecimal.length; i++) {
      if (i > 0 && i % 3 == 0) {
        formattedReversed += AppConstants.comma;
      }
      formattedReversed += reversedBeforeDecimal[i];
    }

    final resultBeforeDecimal = formattedReversed.split('').reversed.join();

    final result = parts.length > 1
        ? '$resultBeforeDecimal${AppConstants.point}${parts[1]}'
        : resultBeforeDecimal;

    return value.startsWith(AppConstants.hyphen)
        ? '${AppConstants.hyphen}$result'
        : result;
  }
}
