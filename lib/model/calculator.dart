import 'package:flutter/foundation.dart';
import 'package:expressions/expressions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Calculator extends ChangeNotifier {
  String _expression = '';

  String get expression => _expression;

  void append(String value) {
    _expression += value;
    notifyListeners();
  }

  void clear() {
    _expression = '';
    notifyListeners();
  }

  void calculate() {
    try {
      final expression = Expression.parse(_expression);
      final evaluator = const ExpressionEvaluator();
      final result = evaluator.eval(expression, {});
      _expression = result.toString();
    } catch (e) {
      _expression = 'Error';
    }
    notifyListeners();
  }
}

// Create a ChangeNotifierProvider for the Calculator
final calculatorProvider = ChangeNotifierProvider<Calculator>((ref) {
  return Calculator();
});
