import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calculator/screen/calculator_app.dart';

void main() {
  runApp(
    ProviderScope(
      child: CalculatorApp(),
    ),
  );
}
